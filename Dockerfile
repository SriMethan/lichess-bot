FROM debian:stable-slim
MAINTAINER Doctor
RUN echo Doctor
CMD echo Doctor
COPY . .


RUN apt-get update && apt-get install -y --no-install-recommends python build-essential cmake nodejs git-core uglifyjs ca-certificates default-jre-headless

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full


RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/antichess.bin" -O antichess.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/atomic.bin" -O atomic.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/horde.bin" -O horde.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/racingKings.bin" -O racingKings.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/threeCheck.bin" -O threeCheck.bin
RUN wget --no-check-certificate "https://fbserv.herokuapp.com/file/books/kingOfTheHill.bin" -O kingofthehill.bin



COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x ./engines/Developed_SF
RUN chmod +x ./engines/fsf_linux

CMD python3 run.py
