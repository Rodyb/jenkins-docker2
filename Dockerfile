FROM jenkins/jenkins:lts
USER root

RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 usermod --uid 1002 jenkins && \
 groupmod --gid 1000 jenkins && \
 groupadd -g 998 docker && \
 usermod -aG staff,docker jenkins

#USER jenkins
