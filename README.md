##using languages

![Python](https://img.shields.io/badge/-Python-3776AB?logo=python&logoColor=ffffff)
![C++](https://img.shields.io/badge/-C++-00599C?logo=c%2b%2b&logoColor=ffffff)
![Java](https://img.shields.io/badge/-Java-007396?logo=Java&logoColor=000000)
![JavaScript](https://img.shields.io/badge/-JavaScript-F7DF1E?&logo=javascript&logoColor=000000)

##using apps

![VS Code](https://img.shields.io/badge/VSCode-%23007ACC?logo=Visual-studio-code)
![Pycharm](https://img.shields.io/badge/PyCharm-green?logo=PyCharm)
![Linux](https://img.shields.io/badge/-Linux-FCC624?logo=linux&logoColor=000000)

# MAINTAINERS 
- [Drdisrespect1](https://lichess.org/@/drdisrespect1) and [drrespectable](https://lichess.org/@/drrespectable)


# lichess-bot

Engine communication code taken from https://github.com/ShailChoksi/lichess-bot by [ShailChoksi](https://github.com/ShailChoksi)

### Bot Information

-  Engine      [Stockfish  (dev)](https://abrok.eu/stockfish/builds/ad357e147a1b8481a04761d726ce1db14115a68f/linux64modern/stockfish_21082721_x64_modern.zip) 
-  Using standard book [Cerebellum3Merge.bin](https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z)
-  using antichess book [bestanti](https://github.com/codingforhelp/Lichess-Dev-Bot/raw/main/engines/antibest.bin)
-  using books other all variants too!
-  Use nnue for all variants 

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

#### How to use stockfish
- now your bot playing all variants, But standard is not strongest like stockfish dev (but only standard)
- you can change (if you need standard but) change this [6th line of config.yml](/config.yml#L6) type on type on `fairy-sf` or `chess-engine` after' sure so strongest for standard but not play other variants. again if you need play all variants change this again [6th line of config.yml](/config.yml#L6) type on `fsf` or `fairy-sf`  then play all variants (But standard so strogest)

#### How to change nnue
- you can keep your nnue  [here](/config.yml#L60).

### If you need accept bots 
- you can change [81th line of config.yml](/config.yml#L81) type on `true` , then wait 2 mins during auto deploy (without playing) , after  your bot will accept 

## If you have any quastion please inform me ##
  
  [Drdisrespect1](https://lichess.org/@/drdisrespect1) and [drrespectable](https://lichess.org/@/drrespectable)
  
  


