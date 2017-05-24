# See git-resources image:
# - https://github.com/concourse/git-resource
FROM concourse/git-resource:latest" as git-resource

# Base image
FROM composer

MAINTAINER Warnar Boekkooi <wbo@hellofresh.com>

# Get the git resource assets
COPY --from=git-resource /opt/resource/ /opt/git-resource/

# According to https://github.com/concourse/buildroot-images/blob/master/git/Dockerfile
# can't `git pull` unless we set these
RUN git config --global user.email "git@localhost" && \
    git config --global user.name "git"

# Install jq
RUN apk add --upgrade --no-cache jq

# Add assets
ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

# Command SH
CMD ["/bin/sh"]
