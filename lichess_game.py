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
