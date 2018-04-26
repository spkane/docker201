FROM jenkinsci/jenkins:2.90
USER root

# If apt-get update fails and you are behind a proxy,
# you can try uncommenting the next 2 lines to fix it.
#RUN mkdir -p /etc/apt/apt.conf.d
#ADD ./99fixbadproxy /etc/apt/apt.conf.d/99fixbadproxy

RUN apt-get -y update && \
    apt-get -y install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo ${ID}) $(lsb_release -cs) stable" && \
    apt-get -y update && \
    apt-get -y install docker-ce && \
    gpasswd -a jenkins staff && \
    gpasswd -a jenkins users && \
    gpasswd -a jenkins docker

USER jenkins
RUN /usr/local/bin/install-plugins.sh \
      ace-editor:1.1 \
      ant:1.7 \
      antisamy-markup-formatter:1.5 \
      authentication-tokens:1.3 \
      bouncycastle-api:2.16.2 \
      branch-api:2.0.15 \
      build-timeout:1.19 \
      cloudbees-folder:6.2.1 \
      credentials-binding:1.13 \
      credentials:2.1.16 \
      display-url-api:2.1.0 \
      docker-commons:1.9 \
      docker-workflow:1.12 \
      durable-task:1.16 \
      email-ext:2.61 \
      embeddable-build-status:1.9 \
      external-monitor-job:1.7 \
      git-client:2.6.0 \
      git-server:1.7 \
      git:3.6.4 \
      github-api:1.90 \
      github:1.27.0 \
      gogs-webhook:1.0.10 \
      gradle:1.28 \
      handlebars:1.1.1 \
      icon-shim:2.0.3 \
      jquery-detached:1.2.1 \
      junit:1.22.2 \
      ldap:1.18 \
      mailer:1.20 \
      mapdb-api:1.0.9.0 \
      mask-passwords:2.10.1 \
      matrix-auth:2.2 \
      matrix-project:1.12 \
      momentjs:1.1.1 \
      pam-auth:1.3 \
      pipeline-build-step:2.5.1 \
      pipeline-graph-analysis:1.4 \
      pipeline-input-step:2.8 \
      pipeline-milestone-step:1.3.1 \
      pipeline-model-api:1.2.4 \
      pipeline-model-declarative-agent:1.1.1 \
      pipeline-model-definition:1.1.8 \
      pipeline-model-extensions:1.1.8 \
      pipeline-rest-api:2.8 \
      pipeline-stage-step:2.3 \
      pipeline-stage-tags-metadata:1.2.4 \
      pipeline-stage-view:2.8 \
      plain-credentials:1.4 \
      resource-disposer:0.8 \
      scm-api:2.2.5 \
      script-security:1.35 \
      ssh-credentials:1.13 \
      ssh-slaves:1.22 \
      structs:1.10 \
      subversion:2.9 \
      timestamper:1.8.8 \
      token-macro:2.3 \
      windows-slaves:1.3.1 \
      workflow-aggregator:2.5 \
      workflow-api:2.23.1 \
      workflow-basic-steps:2.6 \
      workflow-cps-global-lib:2.8 \
      workflow-cps:2.40 \
      workflow-durable-task-step:2.17 \
      workflow-job:2.15 \
      workflow-multibranch:2.15 \
      workflow-scm-step:2.6 \
      workflow-step-api:2.13 \
      workflow-support:2.16 \
      ws-cleanup:0.34

ENV no_proxy gogs

# We really want this to run as the Jenkins user
# but for class it is challenging to get the docker socket
# permissions correct for every student, so we use root instead.
USER root
