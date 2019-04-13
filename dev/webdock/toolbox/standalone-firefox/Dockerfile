FROM ubuntu:latest
CMD ["geckodriver", "--host", "0.0.0.0", "--port", "4444", "--log", "debug"]
EXPOSE 4444

RUN apt-get update && apt-get install --yes --no-install-recommends \
  firefox \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz /root
RUN tar -xf /root/geckodriver-v0.24.0-linux64.tar.gz -C /usr/local/bin
