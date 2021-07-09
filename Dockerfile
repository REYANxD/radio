FROM python:latest

ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ffmpeg opus-tools bpm-tools
RUN python -m pip install --upgrade pip
RUN python -m pip install wheel Pyrogram TgCrypto
RUN python -m pip install pytgcalls ffmpeg-python psutil
RUN python -m pip install tgintegration youtube-dl youtube_search requests

RUN git clone https://github.com/VASU-XD/radio
RUN cd radio
RUN sudo apt-get install python3-pip ffmpeg
RUN pip3 install -U pip
RUN pip3 install -U -r requirements.txt

WORKDIR /radio-safone
CMD python3 main.py
