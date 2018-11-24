FROM fluent/fluent-bit:latest
# uses root user
# exposes port 2020

EXPOSE 24224

ENV FF_SELF_HOSTNAME="fluent-bit.tld" \
  FF_SHARED_SECRET="ThisTokenIsNotSoSecretChangeIt" \
  FF_FLUENT_COLLECTOR_HOST="127.0.0.1" \
  FF_FLUENT_COLLECTOR_PORT="24284"

COPY etc /fluent-bit/etc
