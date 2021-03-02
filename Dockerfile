FROM python:2.7

WORKDIR /

RUN git clone https://github.com/puzzlepeaches/peas

WORKDIR /peas
RUN apt-get update && apt-get install libwbxml2-dev -y
RUN pip2 install -r requirements.txt
RUN python2 setup.py install

ENTRYPOINT ["peas"]

