FROM jenkins/jenkins:lts
USER root


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69 && \
 echo "deb https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list && \
 curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
 mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 apt-get update && \
 apt-get install k6 nodejs && \
 npm install -g yarn && \
 apt-get install procps -y && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins


USER jenkins
