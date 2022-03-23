from api import API
from challenge_handler import Challenge_Handler
from config import load_config
from enums import Variant
from game_counter import Game_Counter
from logo import LOGO
from matchmaking import Matchmaking


class Heroku_Matchmaking:
    def __init__(self) -> None:
        self.config = load_config()
        self.api = API(self.config['token'])
        self.game_count = Game_Counter(self.config['challenge'].get('concurrency', 1))

    def start(self) -> None:
        print(LOGO)

        self.challenge_handler = Challenge_Handler(self.config, self.api, self.game_count)
        self.challenge_handler.stop_accepting_challenges()
        self.challenge_handler.start()

        print('Starting matchmaking ...')

        self.matchmaking = Matchmaking(self.config, self.api, Variant.STANDARD)
        self.matchmaking.start()


if __name__ == '__main__':
    hm = Heroku_Matchmaking()
    hm.start()
