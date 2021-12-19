FROM ubuntu:21.10
MAINTAINER RAVIHARAV
RUN echo RAVIHARAV
CMD echo RAVIHARAV
COPY . .

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata

RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full build-essential git > apti.log

RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.logRUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z \
&& 7z e Goi5.1.bin.7z && rm Goi5.1.bin.7z
RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z \
&& 7z e Cerebellum3Merge.bin.7z && rm Cerebellum3Merge.bin.7z
RUN wget --no-check-certificate -nv "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/Drawkiller_EloZoom_big.bin" -O Drawkiller_EloZoom_big.bin 
RUN wget --no-check-certificate -nv "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/Perfect2021.bin" -O Perfect2021.bin
RUN wget --no-check-certificate -nv "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/bestbook.bin" -O bestbook.bin
RUN wget --no-check-certificate -nv "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/elo3300.bin" -O elo3300.bin 
RUN wget --no-check-certificate -nv "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/komodo.bin" -O komodo.bin 
RUN wget --no-check-certificate -nv "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/tcec.bin" -O tcec.bin
RUN wget --no-check-certificate -nv "https://fbserv.herokuapp.com/file/books/antichess.bin" -O antichess.bin
RUN wget --no-check-certificate -nv "https://fbserv.herokuapp.com/file/books/atomic.bin" -O atomic.bin
RUN wget --no-check-certificate -nv "https://fbserv.herokuapp.com/file/books/horde.bin" -O horde.bin 
RUN wget --no-check-certificate -nv "https://fbserv.herokuapp.com/file/books/racingKings.bin" -O racingKings.bin 
RUN wget --no-check-certificate -nv "https://fbserv.herokuapp.com/file/books/threeCheck.bin" -O threeCheck.bin 
RUN wget --no-check-certificate -nv "https://github.com/RaviharaV-bot/sfbot/raw/main/stockfish_x64_modern" -O stockfish_x64_modern 
#RUN wget --no-check-certificate -nv "https://abrok.eu/stockfish/builds/7262fd5d14810b7b495b5038e348a448fda1bcc3/linux64modern/stockfish_21102807_x64_modern.zip" -O chess-engine.zip \ 
RUN wget --no-check-certificate -nv "https://github.com/codingforhelp/Lichess-Dev-Bot/raw/main/engines/allplay.bin" -O allplay.bin 
RUN wget --no-check-certificate -nv "https://fbserv.herokuapp.com/file/books/kingOfTheHill.bin" -O kingofthehill.bin
#RUN wget --no-check-certificate -nv "https://github.com/codingforhelp/Lichess-Dev-Bot/raw/main/engines/fairy-sf" -O fairy-sf
RUN python3 -m pip install -r requirements.txt
RUN chmod +x ./engines/stockfish_14_Dev
RUN chmod +x ./engines/stockfish_14.1_linux_x64
RUN chmod +x ./engines/fsf
#RUN chmod +x /fairy-sf
#RUN chmod +x ./engines/fairy-stockfish
RUN chmod +x ./stockfish_x64_modern
CMD python3 lichess-bot.py 

