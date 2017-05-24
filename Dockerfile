# Base image
FROM composer

MAINTAINER Warnar Boekkooi <wbo@hellofresh.com>

# According to https://github.com/concourse/buildroot-images/blob/master/git/Dockerfile
# can't `git pull` unless we set these
RUN git config --global user.email "git@localhost" && \
    git config --global user.name "git"

# Get the git resource assets
RUN git clone --depth 1 https://github.com/concourse/git-resource.git /tmp/git-resource \
    && mkdir /opt/ \
    && mv /tmp/git-resource/assets /opt/git-resource \
    && /tmp/git-resource/scripts/install_git_lfs.sh \
    && rm -rf /tmp/git-resource

# Install jq
RUN apk add --upgrade --no-cache jq

# Add assets
ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

# Command SH
CMD ["/bin/sh"]
