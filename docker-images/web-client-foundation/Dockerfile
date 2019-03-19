FROM nginx:latest
USER root
WORKDIR /app
ENV VERSION="undefined"

RUN groupadd --gid 1000 deploy \
&& useradd --uid 1000 --gid deploy --shell /bin/sh --create-home deploy

RUN apt-get update \
&& apt-get install --yes \
  curl \
&& apt-get clean

COPY etc/nginx.template.conf /etc/nginx/nginx.template.conf
ENV NGINX_WORKERS_COUNT="1"

COPY bin/*.bash /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.bash
ENTRYPOINT ["entrypoint.bash"]
CMD ["nginx", "-v"]
HEALTHCHECK NONE
