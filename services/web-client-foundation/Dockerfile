FROM nginx:latest
# nginx:~ exposes port 80

RUN apt-get update

RUN apt-get install --yes \
    apache2-utils \
&& apt-get clean

CMD ["exit", "0"]
