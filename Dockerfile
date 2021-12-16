FROM debian:stable-slim
MAINTAINER RAVIHARAV
RUN echo RAVIHARAV
CMD echo RAVIHARAV
COPY . .

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full
RUN cd engines
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
Run 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN cd -
RUN python3 -m pip install -r requirements.txt
RUN python3 lichess-bot.py -u
