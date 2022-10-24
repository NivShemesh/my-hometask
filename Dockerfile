FROM python:3
WORKDIR /app
COPY main.py ./
RUN chmod a+x main.py
CMD python3 ./main.py
