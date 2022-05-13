ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk update && \
    apk add --no-cache \
    nodejs-current \
    npm

COPY src/package.json /
RUN cd / && npm i
COPY src /

COPY run.sh /
RUN chmod +x /run.sh
CMD [ "/run.sh" ]