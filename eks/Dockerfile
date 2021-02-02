FROM jenkins/inbound-agent:4.6-1
USER root
# ENV IMG_SHA256="cc9bf08794353ef57b400d32cd1065765253166b0a09fba360d927cfbd158088"
# ENV IMG_DISABLE_EMBEDDED_RUNC=1
RUN apt-get update && apt-get install -y sudo uidmap libseccomp-dev runc && adduser jenkins sudo && rm -rf /var/lib/apt/lists/*
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# RUN chmod u-s /usr/bin/new[gu]idmap && setcap cap_setuid+eip /usr/bin/newuidmap && setcap cap_setgid+eip /usr/bin/newgidmap
# RUN mkdir -p /run/runc && chmod 777 /run/runc
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm -rf awscliv2.zip aws
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
# RUN curl -fSL "https://github.com/genuinetools/img/releases/download/v0.5.11/img-linux-amd64" -o "/usr/local/bin/img" && echo "${IMG_SHA256}  /usr/local/bin/img" | sha256sum -c - && chmod a+x "/usr/local/bin/img"
ARG user=jenkins
USER jenkins
ENV USER jenkins
RUN mkdir .aws && mkdir .kube
# COPY aws/* .aws/
# COPY kube/* .kube/
ENTRYPOINT ["jenkins-agent"]