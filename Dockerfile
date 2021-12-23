FROM   debian:stable-slim
MAINTAINER drrespectable
RUN echo drrespectable
CMD echo drrespectable
COPY . .


RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
Run 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/antichess.bin" -O antichess.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/atomic.bin" -O atomic.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/horde.bin" -O horde.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/racingKings.bin" -O racingKings.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/threeCheck.bin" -O threeCheck.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/kingOfTheHill.bin" -O KingOfTheHill.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/atomic.bin" -O atomic.bin
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Syzygy/-/archive/MEGA/Syzygy-MEGA.zip" -O syzygy-MEGA.zip
RUN wget --no-check-certificate "https://abrok.eu/stockfish/builds/7d82f0d1f4e25892e1901d25cf5cf6f6a2606c2a/linux64ssse/stockfish_21122211_x64_ssse.zip" -O chess-engine.zip
RUN wget --no-check-certificate "https://data.stockfishchess.org/nn/nn-938525872610.nnue" -O nn-938525872610.nnue
RUN wget --no-check-certificate "https://github.com/stockfihnim/Variants-Bot/raw/main/engines/3check-3ed5960cfcf3.nnue" -O nn-3check-3ed5960cfcf3.nnue
RUN wget --no-check-certificate "https://github.com/stockfihnim/Variants-Bot/raw/main/engines/atomic-36ea696742e1.nnue" -O nn-atomic-36ea696742e1.nnue
RUN wget --no-check-certificate "https://github.com/stockfihnim/Variants-Bot/raw/main/engines/racingkings-67476a9e2e20.nnue" -O nn-racingkings-67476a9e2e20.nnue
RUN wget --no-check-certificate "https://github.com/stockfihnim/Variants-Bot/raw/main/engines/kingofthehill-86a538a53974.nnue" -O nn-kingofthehill-86a538a53974.nnue
RUN 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* chess-engine

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x chess-engine
RUN chmod +x ./engines/fairy-sf

CMD python3 run.py
