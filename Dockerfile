# Base image
FROM composer

MAINTAINER Warnar Boekkooi <wbo@hellofresh.com>

# According to https://github.com/concourse/buildroot-images/blob/master/git/Dockerfile
# can't `git pull` unless we set these
RUN git config --global user.email "git@localhost" && \
    git config --global user.name "git"

# Install git lfs
ADD scripts/install_git_lfs.sh install_git_lfs.sh
RUN ./install_git_lfs.sh

# Install jq
RUN apk add --upgrade --no-cache jq

# Add assets
ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

# Command SH
CMD ["/bin/sh"]
