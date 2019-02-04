FROM fluent/fluent-bit:latest

EXPOSE 24224

ENV FF_SELF_HOSTNAME="fluent-bit.tld"
ENV FF_SHARED_SECRET="ThisTokenIsNotSoSecretChangeIt"
ENV FF_FLUENT_COLLECTOR_HOST="127.0.0.1"
ENV FF_FLUENT_COLLECTOR_PORT="24284"

COPY etc /fluent-bit/etc
