import pickle
from typing import Tuple

import chess
import chess.engine
import chess.polyglot
from chess.variant import find_variant

from enums import Variant

UCI_Move = str
CP_Score = int
Depth = int
Outcome = str
Offer_Draw = bool
Resign = bool


      
            if self.is_white:
                white_time = self.white_time - self.move_overhead if self.white_time > self.move_overhead else self.white_time
                white_time /= 1000
                black_time = self.black_time / 1000
            else:
                black_time = self.black_time - self.move_overhead if self.black_time > self.move_overhead else self.black_time
                black_time /= 1000
                white_time = self.white_time / 1000
            increment = self.increment / 1000

            limit = chess.engine.Limit(white_clock=white_time, white_inc=increment,
                                       black_clock=black_time, black_inc=increment)
            ponder = self.config['engine']['ponder']

        result = self.engine.play(self.board, limit, info=chess.engine.INFO_ALL, ponder=ponder)
        if result.move:
            score = result.info.get('score', chess.engine.PovScore(chess.engine.Mate(1), self.board.turn))
            self.scores.append(score)
            return result.move, result.info
        raise RuntimeError('Engine could not make a move!')

    def _format_move(self, move: chess.Move) -> str:
        if self.board.turn:
            move_number = str(self.board.fullmove_number) + '.'
            return f'{move_number:4} {self.board.san(move)}'
        else:
            move_number = str(self.board.fullmove_number) + '...'
            return f'{move_number:6} {self.board.san(move)}'

    def _format_info(self, info: chess.engine.InfoDict) -> str:
        info_score = info.get('score')
        score = f'{self._format_score(info_score):7}' if info_score else 7 * ' '

        info_depth = info.get('depth')
        info_seldepth = info.get('seldepth')
        depth_str = f'{info_depth}/{info_seldepth}'
        depth = f'{depth_str:6}' if info_depth and info_seldepth else 6 * ' '

        info_nps = info.get('nps')
        nps = f'nps: {info_nps/1000000:4.1f} M' if info_nps else 7 * ' '

        info_time = info.get('time')
        time = f'mt: {info_time:4.1f} s' if info_time else 10 * ' '

        info_hashfull = info.get('hashfull')
        hashfull = f'hash: {info_hashfull/10:4.1f} %' if info_hashfull else 12 * ' '

        info_tbhits = info.get('tbhits')
        tbhits = f'tb: {info_tbhits}' if info_tbhits else ''

        return '     '.join((score, depth, nps, time, hashfull, tbhits))

    def _format_score(self, score: chess.engine.PovScore) -> str:
        if not score.is_mate():
            if cp_score := score.relative.score():
                cp_score /= 100
                return format(cp_score, '+7.2f')
            else:
                return '   0.00'
        else:
            return str(score.relative)

    def _get_engine(self) -> chess.engine.SimpleEngine:
        engine = chess.engine.SimpleEngine.popen_uci(self.config['engine']['path'])
        options = self.config['engine']['uci_options']

        def not_managed(key: str): return not chess.engine.Option(key, '', None, None, None, None).is_managed()
        options = {key: value for key, value in options.items() if not_managed(key)}

        engine.configure(options)

        return engine

    def _setup_board(self, gameFull_event: dict) -> chess.Board:
        if gameFull_event['variant']['key'] == 'chess960':
            board = chess.Board(gameFull_event['initialFen'], chess960=True)
        elif gameFull_event['variant']['name'] == 'From Position':
            board = chess.Board(gameFull_event['initialFen'])
        else:
            VariantBoard = find_variant(gameFull_event['variant']['name'])
            board = VariantBoard()

        for move in gameFull_event['state']['moves'].split():
            board.push_uci(move)

        return board

    def _get_move_overhead(self) -> int:
        move_overhead = self.initial_time // 60 - self.increment

        return move_overhead if move_overhead >= 0 else 0

    def _has_time(self, min_time: int) -> bool:
        return self.white_time >= min_time if self.is_white else self.black_time >= min_time

    def _reduce_own_time(self, milliseconds: int) -> None:
        if self.is_white:
            self.white_time -= milliseconds
        else:
            self.black_time -= milliseconds
