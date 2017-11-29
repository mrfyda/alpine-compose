FROM develar/java
MAINTAINER Rafael Cortês <rafael.cortes@tecnico.ulisboa.pt>

ENV DOCKER_COMPOSE_VERSION=1.17.1

RUN set -x && \
    apk add --no-cache -t .deps ca-certificates curl && \
    # Install docker-compose
    # https://docs.docker.com/compose/install/
    DOCKER_COMPOSE_URL=https://github.com$(curl -L https://github.com/docker/compose/releases/${DOCKER_COMPOSE_VERSION} | grep -Eo 'href="[^"]+docker-compose-Linux-x86_64' | sed 's/^href="//') && \
    curl -Lo /usr/local/bin/docker-compose $DOCKER_COMPOSE_URL && \
    chmod a+rx /usr/local/bin/docker-compose && \
    \
    # Basic check it works
    docker-compose version && \
    \
    # Clean-up
    apk del .deps
