FROM debian:stable-slim

ARG VERSION
ARG MODULE

ENV \
 LIBVA_DRIVERS_PATH="/usr/lib/x86_64-linux-gnu/dri" \
 LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu" \
 NVIDIA_DRIVER_CAPABILITIES="compute,video,utility" \
 NVIDIA_VISIBLE_DEVICES="all" \
 HANDBRAKE=1.5.1

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://github.com/codingforhelp/Lichess-Bot/raw/master/engines/sf-fairy" -O fsf
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
Run 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN wget --no-check-certificate "https://abrok.eu/stockfish/builds/590447d7a162058ed1f68270c84aac4e2f256bb1/linux64modern/stockfish_21082209_x64_modern.zip" -O chess-engine.zip
RUN wget --no-check-certificate "https://data.stockfishchess.org/nn/nn-938525872610.nnue" -O nn-938525872610.nnue
RUN 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* chess-engine

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x chess-engine
RUN chmod +x fsf

CMD python3 CMD python3 run.py
