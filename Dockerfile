FROM python:2.7

WORKDIR /

RUN git clone https://github.com/puzzlepeaches/peas

WORKDIR /peas
RUN pip2 install -r requirements.txt
RUN python2 setup.py install

ENTRYPOINT ["peas"]

