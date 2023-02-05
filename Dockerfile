# 3.9-alpine is new, small and stable image.
FROM python:3.9-alpine 

WORKDIR /home/task

COPY requirements.txt ./

RUN pip install -r requirements.txt

# copy flask app and test files.
COPY src src
COPY tests tests

# metadata only (doesn't expose a port actually)
EXPOSE 5000

CMD [ "python" , "./src/hello.py" ]
