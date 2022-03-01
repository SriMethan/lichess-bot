# LICHESS BOT

[![Python Build](https://github.com/codingforhelp/Lichess-Bot/actions/workflows/python-build.yml/badge.svg)](https://github.com/codingforhelp/Lichess-Bot/actions/workflows/python-build.yml)

A bridge between [Lichess Bot API](https://lichess.org/api#tag/Bot) and bots.

## using languages

![Python](https://img.shields.io/badge/-Python-3776AB?logo=python&logoColor=ffffff)

# By Shailchoksi Bot code

Engine communication code taken from https://github.com/ShailChoksi/lichess-bot by [ShailChoksi](https://github.com/ShailChoksi)

# lichess-bot
- A bridge between [Lichess API](https://lichess.org/account/oauth/token/create?scopes%5B%5D=bot:play&description=Lichess+Bot+Token) and bots.
- This bot is made with Python and it is running using stack container and is concentrated on heroku.

## How to Install on Heroku
- Import or [Fork](https://github.com/LichessBot-Coders/Lichess-Coded-Bots/fork) this repository to your Github.
- Open the `config.yml` file and insert your [API access token](https://lichess.org/account/oauth/token/create?scopes[]=bot:play&description=Lichess+Bot+Token) in to token option and commit changes over [here](/config.yml#L1).
- Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and [create a new app](https://dashboard.heroku.com/new-app) in Heroku. <br/>
**Do note that in certain operating systems Heroku CLI doesn't get added to path automatically. If that's the case you'll have to add heroku to your path manually.**
- Run this command in cmd or powershell `heroku stack:set container -a appname`, where `appname` is replaced with your Heroku app's name.
- In heroku, in the `Deploy` tab click on `Connect to GitHub` and then click on `search` and select your fork/import of this repository.
- Now scroll down and under `Manual deploy`, click on `deploy` with the `master` branch selected. <br/> <br/>
Note: You could also `Enable Automatic Deploys` with the `master` branch selected if you would like each commit you make to get automatically and easily deployed onto your bot. It is your choice whether you'd like to Enable or Disable Automatic Deploys.
- After deploying wait for about 5 minutes till the build finishes and then in the `Resources` tab in heroku turn `worker` dynos. If you do not see any option to enable any dynos, then you'll have to wait for about 5 minutes and then refresh your page on heroku.

 **You're now connected to lichess and awaiting challenges! Your bot is up and ready!**


## If you need to play variants 

 - you can change [6th line of config.yml](/config.yml#L6) put `fsf`

