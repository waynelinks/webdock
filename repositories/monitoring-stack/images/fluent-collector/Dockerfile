FROM fluent/fluentd:latest
# has user fluent:1000
# has group fluent:1000
# exposes port 5140 and 24224

# https://github.com/fluent/fluentd-docker-image#3-customize-dockerfile-to-install-plugins-optional
RUN apk add --update --virtual .build-deps sudo build-base ruby-dev \
&& sudo gem install \
  fluent-plugin-mongo \
  fluent-plugin-secure-forward \
&& sudo gem sources --clear-all \
&& apk del .build-deps \
&& rm -rf /var/cache/apk/* /home/fluent/.gem/ruby/2.4.0/cache/*.gem

EXPOSE 24284

ENV FC_SELF_HOSTNAME="fluentd.tld" \
  FC_SHARED_SECRET="ThisTokenIsNotSoSecretChangeIt" \
  FC_MONGO_HOST="127.0.0.1" \
  FC_MONGO_PORT="27017" \
  FC_MONGO_USER="" \
  FC_MONGO_PASSWORD="" \
  FC_MONGO_DATABASE="fluent" \
  FC_MONGO_COLLECTION="logs"

COPY etc /fluentd/etc
