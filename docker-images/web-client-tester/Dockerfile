FROM damlys/webdock-web-assets-builder:0.0.1-example

ENV WEBCLIENTTESTER_SELENIUM_HUB_HOST="127.0.0.1"
ENV WEBCLIENTTESTER_SELENIUM_HUB_PORT="4444"
ENV WEBCLIENTTESTER_TESTS_TARGET_URL="http://127.0.0.1:80"

COPY app/package.json app/package-lock.json /opt/app/
WORKDIR /opt/app
RUN npm install --ignore-scripts --production

COPY app /opt/app
RUN npm install --production
