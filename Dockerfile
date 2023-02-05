# FROM python:3.11.1-slim-buster
FROM python:3.9-alpine

WORKDIR /home/Task

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "python" , "./src/hello.py" ]
