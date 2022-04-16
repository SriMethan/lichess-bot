# Overview

**BotLi** is a bot for Lichess. Strongly inspired by [ShailChoksi/lichess-bot](https://github.com/ShailChoksi/lichess-bot). It extends its features with a matchmaking mode where the bot automatically challenges other bots with similar ratings.

Not every function of the bot is extensively tested, a faulty or incomplete `config.yml` will lead to unexpected behavior. Other chess variants than Standard and Chess960 are untested. At least Python 3.10 is required.

# Heroku

# Chess Engines

- [Stockfish](https://github.com/official-stockfish/Stockfish)
- [Stockfish Multi Variant (dev)](https://github.com/ddugovic/Stockfish)

# Heroku Stack

- [`Container`](https://devcenter.heroku.com/articles/container-registry-and-runtime)

# How to install

- Import or [Fork](https://github.com/SriMethan/botli-heroku/fork) this repository to your Github.
- Open the `Settings` tab on heroku and insert your [API access token with `bot:play` scopes enabled](https://lichess.org/account/oauth/token/create?scopes[]=bot:play&description=Lichess+Bot+Token) in the `Config vars` field in the format `LICHESS_BOT_TOKEN:API-ACCESS-TOKEN`, where you replace `API-ACCESS-TOKEN` with your API Access token.
- Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and [create a new app](https://dashboard.heroku.com/new-app) in Heroku. <br/>
**Do note that in certain operating systems Heroku CLI doesn't get added to path automatically. If that's the case you'll have to add heroku to your path manually.**
- Run this command in cmd or powershell `heroku stack:set container -a appname`, where `appname` is replaced with your Heroku app's name.
- In heroku, in the `Deploy` tab click on `Connect to GitHub` and then click on `search` and select your fork/import of this repository.
- Now scroll down and under `Manual deploy`, click on `deploy` with the `heroku` branch selected. <br/> <br/>
Note: You could also `Enable Automatic Deploys` with the `heroku` branch selected if you would like each commit you make to get automatically and easily deployed onto your bot. It is your choice whether you'd like to Enable or Disable Automatic Deploys.
- After deploying wait for about 5 minutes till the build finishes and then in the `Resources` tab in heroku turn `worker` dynos. If you do not see any option to enable any dynos, then you'll have to wait for about 5 minutes and then refresh your page on heroku.

**You're now connected to lichess and awaiting challenges! Your bot is up and ready!**

__CAUTION:__ Be careful with matchmaking mode, lichess will rate limit you if you let it run for too long!

# Setup polyglot opening book
To use a polyglot opening book the name of the book and the path to the book must be entered at the end of the config in the section `books`.

Several books can be entered here. In the upper area `eninge: polyglot: books` only the name of the book must be entered. In addition, different books can be used for white, black and chess960. If no specific book is defined, the `standard` book is used.

## Matchmaking mode

You can activate the matchmaking mode in your `Dockerfile`.

__CAUTION:__ Be careful with matchmaking mode, lichess will rate limit you if you let it run for too long!

## Acknowledgements
Thanks to the Lichess team, especially T. Alexander Lystad and Thibault Duplessis for working with the LeelaChessZero team to get this API up. Thanks to the [Niklas Fiekas](https://github.com/niklasf) and his [python-chess](https://github.com/niklasf/python-chess) code which allows engine communication seamlessly. In addition, the idea of this bot is based on [ShailChoksi/lichess-bot](https://github.com/ShailChoksi/lichess-bot).

## License
**BotLi** is licensed under the AGPLv3 (or any later version at your option). Check out the [LICENSE file](/LICENSE) for the full text.