FROM ubuntu:latest

RUN apt-get update

RUN apt-get install --yes \
  curl \
  firefox \
&& apt-get clean

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz | tar xzC /usr/local/bin

EXPOSE 4444
CMD ["geckodriver", "--host", "0.0.0.0", "--port", "4444", "--log", "debug"]
