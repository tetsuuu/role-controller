FROM alpine:3.10

RUN apk update

RUN apk add bash

# Install build packages
RUN apk add --no-cache bash
RUN apk -Uuv add groff less python py-pip py-yaml
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app

COPY ./list_rules.sh ./

CMD ["./list_rules.sh"]