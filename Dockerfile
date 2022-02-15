FROM ubuntu:latest
MAINTAINER drrespectable
RUN echo drrespectable
CMD echo drrespectable
COPY . .

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt


RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
RUN 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/antichess.bin" -O antichess.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/atomic.bin" -O atomic.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/horde.bin" -O horde.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/racingKings.bin" -O racingKings.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/threeCheck.bin" -O threeCheck.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/kingOfTheHill.bin" -O KingOfTheHill.bin
RUN wget --no-check-certificate "https://abrok.eu/stockfish/builds/3ec6e1d2450183ed4975cf569b5a1286cb9d8369/linux64/stockfish_22021301_x64.zip" -O chess-engine.zip
RUN wget --no-check-certificate "https://data.stockfishchess.org/nn/nn-938525872610.nnue" -O nn-938525872610.nnue
RUN 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* chess-engine


RUN chmod +x fsf_linux 
RUN chmod +x chess-engine
RUN chmod +x ./engines/sf-fairy

CMD python3 run.py
