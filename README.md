# lichess-bot

Engine communication code taken from https://github.com/ShailChoksi/lichess-bot by [ShailChoksi](https://github.com/ShailChoksi)

### Chess Engine

- [Stockfish Multi Variant (dev)](https://github.com/ddugovic/Stockfish)

### Heroku Buildpack

- [`heroku/python`](https://elements.heroku.com/buildpacks/heroku/heroku-buildpack-python)

### Heroku Stack

- [`heroku-20`](https://devcenter.heroku.com/articles/heroku-20-stack) (allowing a maximum hash size of 512 mb)

### How to Use

- [Fork](https://github.com/SriMethan/lichess-bot-heroku/fork) this repository.
- Edit only your token in the `config.yml` file over [here](/config.yml#L1).
- Create a [new heroku app](https://dashboard.heroku.com/new-app).
- Go to the `Deploy` tab and click `Connect to GitHub`.
- Click on `search` and then select your fork of this repository.
- Then `Enable Automatic Deploys` and then select the `main` branch (which is already done by default usually) and Click `Deploy`.
- Once it has been deployed, go to `Resources` tab on heroku and enable `worker (bash startbot.sh)` dynos. (Do note that if you don't see any dynos in the `Resources` tab, then you must wait for about 5 minutes and then refresh your heroku page.)

You're now connected to lichess and awaiting challenges! Your bot is up and ready!

