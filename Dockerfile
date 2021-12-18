FROM debian:stable-slim
MAINTAINER RAVIHARAV
RUN echo RAVIHARAV
CMD echo RAVIHARAV
COPY . .

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full
RUN apt-get upgrade
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
RUN 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN wget --no-check-certificate "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/Drawkiller_EloZoom_big.bin" -O Drawkiller_EloZoom_big.bin
RUN wget --no-check-certificate "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/Perfect2021.bin" -O Perfect2021.bin
RUN wget --no-check-certificate "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/bestbook.bin" -O bestbook.bin
RUN wget --no-check-certificate "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/elo3300.bin" -O elo3300.bin
RUN wget --no-check-certificate "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/komodo.bin" -O komodo.bin
RUN wget --no-check-certificate "https://github.com/LichessBot-Coders/Lichess-Coded-Bot/raw/main/tcec.bin" -O tcec.bin
#RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/antichess.bin" -O antichess.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/atomic.bin" -O atomic.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/horde.bin" -O horde.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/racingKings.bin" -O racingKings.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/threeCheck.bin" -O threeCheck.bin
RUN wget --no-check-certificate "https://doc-0c-3c-docs.googleusercontent.com/docs/securesc/05m5heda49v4hg08b30t1vae65rbo2lo/vdfb7uh3d2ltbeah9dpporphd6mea6rv/1639798950000/11706750457809039325/06275556888849980936Z/1OiLbpCFcdSK_laWCZCHvRKSXkT1fHCmJ?e=download&nonce=f9sk50cor1hq6&user=06275556888849980936Z&hash=jtgg66a15s7ul56pcbohna57vnjglcj6" -O stockfish_x64_modern
RUN python3 -m pip install -r requirements.txt
RUN chmod +x ./engines/stockfish_14_Dev
RUN chmod +x ./engines/stockfish_14.1_linux_x64
RUN chmod +x ./engines/fsf
RUN chmod +x ./engines/fairy-stockfish
RUN stockfish_x64_modern
CMD python3 lichess-bot.py 

