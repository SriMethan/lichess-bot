# MAINTAINERS 
- [Drdisrespect1](https://lichess.org/@/drdisrespect1) and [drrespectable](https://lichess.org/@/drrespectable)


# lichess-bot

Engine communication code taken from https://github.com/ShailChoksi/lichess-bot by [ShailChoksi](https://github.com/ShailChoksi)

### Bot Information

- Engine      [Stockfish  (dev)](https://abrok.eu/stockfish/builds/ad357e147a1b8481a04761d726ce1db14115a68f/linux64modern/stockfish_21082721_x64_modern.zip) 
-  Using Book [super  book](https://github.com/codingforhelp/Lichess-Bot-Dev/raw/main/engines/supercode.bin)

# lichess-bot
- A bridge between [Lichess API](https://lichess.org/account/oauth/token/create?scopes%5B%5D=bot:play&description=Lichess+Bot+Token) and bots.
- This bot is made with Python and it is running using stack container and is concentrated on heroku.

- ## How to Install on Heroku
- Import or [Fork](https://github.com/codingforhelp/Lichess-Bot-Dev) this repository to your Github.
- Open the `config.yml` file and insert your [API access token](https://lichess.org/account/oauth/token/create?scopes[]=bot:play&description=Lichess+Bot+Token) in to token option and commit changes over [here](/config.yml#L1).
go to  [create a new app](https://dashboard.heroku.com/new-app) in Heroku. <br/>
- In heroku, in the `Deploy` tab click on `Connect to GitHub` and then click on `search` and select your fork/import of this repository.
- Now scroll down and under `Manual deploy`, click on `deploy` with the `master` branch selected. <br/> <br/>
Note: You could also `Enable Automatic Deploys` with the `main` branch selected if you would like each commit you make to get automatically and easily deployed onto your bot. It is your choice whether you'd like to Enable or Disable Automatic Deploys.
- After deploying wait for about 5 minutes till the build finishes and then in the `Resources` tab in heroku turn `worker` dynos. If you do not see any option to enable any dynos, then you'll have to wait for about 5 minutes and then refresh your page on heroku.

**You're now connected to lichess and awaiting challenges! Your bot is up and ready!**

#### How to use stockfish
- now your bot playing all variants, But standard is not strongest like stockfish dev (but only standard)
- you can change (if you need standard but) change this [6th line of config.yml](/config.yml#L6) type on type on `Stockfish_14_Dev` after sure so strongest for standard but not play other variants. again if you need play all variants change this again [6th line of config.yml](/config.yml#L6) type on `fsf` then play all variants 

## If you have any quastion please inform me 
  
  [Drdisrespect1](https://lichess.org/@/drdisrespect1) and [drrespectable](https://lichess.org/@/drrespectable)
  
  
   # ENJOY!!!!!!!!


