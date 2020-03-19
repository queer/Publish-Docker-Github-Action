FROM docker:19.03.2 as runtime
LABEL "repository"="https://github.com/elgohr/Publish-Docker-Github-Action"
LABEL "maintainer"="Lars Gohr"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM runtime as testEnv
RUN apk add --no-cache coreutils bats

FROM runtime
