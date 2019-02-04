FROM fluent/fluentd:latest

# https://github.com/fluent/fluentd-docker-image#3-customize-dockerfile-to-install-plugins-optional
RUN apk add --update --virtual .build-deps sudo build-base ruby-dev \
&& sudo gem install \
  fluent-plugin-mongo \
  fluent-plugin-secure-forward \
&& sudo gem sources --clear-all \
&& apk del .build-deps \
&& rm -rf /var/cache/apk/* /home/fluent/.gem/ruby/2.4.0/cache/*.gem

EXPOSE 24284

ENV FC_SELF_HOSTNAME="fluentd.tld"
ENV FC_SHARED_SECRET="ThisTokenIsNotSoSecretChangeIt"
ENV FC_MONGO_HOST="127.0.0.1"
ENV FC_MONGO_PORT="27017"
ENV FC_MONGO_USER=""
ENV FC_MONGO_PASSWORD=""
ENV FC_MONGO_DATABASE="fluent"
ENV FC_MONGO_COLLECTION="logs"

COPY etc /fluentd/etc
