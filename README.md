
#### How to use Stockfish dev

- You can reset link in [20th line in Dockerfile](/Dockerfile#L20) to the Stockfish dev binary link from [abrok.eu/stockfish](http://abrok.eu/stockfish)
(You can set this `http://abrok.eu/stockfish/latest/linux/stockfish_x64_modern.zip` link for latest Stockfish dev binary)
#### How to use Stockfish nnue of your own choice

- You can reset link in [21th line in Dockerfile](/Dockerfile#L21) to the Stockfish nnue binary link from [https://tests.stockfishchess.org/nns](https://tests.stockfishchess.org/nns).Also in config.yml you have to set the use NNue to true to use nnue after putting binary link . This will be done in config.yml in line 43.

**Note: You need to use `Linux x64 for modern computers` binary for Heroku.**

