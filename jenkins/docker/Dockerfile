FROM jenkinsci/jenkins:2.150.1
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

# Get from a running Jenkins: http://127.0.0.1:8080/script
# Jenkins.instance.pluginManager.plugins.each{plugin -> println ("${plugin.getShortName()}:${plugin.getVersion()}")}
# We add `gogs-webhook` and `mask-passwords` to the defaults
RUN /usr/local/bin/install-plugins.sh \
      ace-editor:1.1 \
      ant:1.9 \
      antisamy-markup-formatter:1.5 \
      apache-httpcomponents-client-4-api:4.5.5-3.0 \
      authentication-tokens:1.3 \
      bouncycastle-api:2.17 \
      branch-api:2.1.2 \
      build-timeout:1.19 \
      cloudbees-folder:6.7 \
      command-launcher:1.2 \
      credentials-binding:1.17 \
      credentials:2.1.18 \
      display-url-api:2.3.0 \
      docker-commons:1.13 \
      docker-workflow:1.17 \
      durable-task:1.28 \
      email-ext:2.63 \
      git-client:2.7.4 \
      git-server:1.7 \
      git:3.9.1 \
      github-api:1.95 \
      github-branch-source:2.4.1 \
      github:1.29.3 \
      gogs-webhook:1.0.14 \
      gradle:1.29 \
      handlebars:1.1.1 \
      jackson2-api:2.9.7.1 \
      jdk-tool:1.2 \
      jquery-detached:1.2.1 \
      jsch:0.1.54.2 \
      junit:1.26.1 \
      ldap:1.20 \
      lockable-resources:2.3 \
      mailer:1.22 \
      mapdb-api:1.0.9.0 \
      mask-passwords:2.12.0 \
      matrix-auth:2.3 \
      matrix-project:1.13 \
      momentjs:1.1.1 \
      pam-auth:1.4 \
      pipeline-build-step:2.7 \
      pipeline-github-lib:1.0 \
      pipeline-graph-analysis:1.9 \
      pipeline-input-step:2.8 \
      pipeline-milestone-step:1.3.1 \
      pipeline-model-api:1.3.3 \
      pipeline-model-declarative-agent:1.1.1 \
      pipeline-model-definition:1.3.3 \
      pipeline-model-extensions:1.3.3 \
      pipeline-rest-api:2.10 \
      pipeline-stage-step:2.3 \
      pipeline-stage-tags-metadata:1.3.3 \
      pipeline-stage-view:2.10 \
      plain-credentials:1.4 \
      resource-disposer:0.12 \
      scm-api:2.3.0 \
      script-security:1.49 \
      ssh-credentials:1.14 \
      ssh-slaves:1.29.1 \
      structs:1.17 \
      subversion:2.12.1 \
      timestamper:1.8.10 \
      token-macro:2.5 \
      trilead-api:1.0.1 \
      workflow-aggregator:2.6 \
      workflow-api:2.33 \
      workflow-basic-steps:2.13 \
      workflow-cps-global-lib:2.12 \
      workflow-cps:2.61 \
      workflow-durable-task-step:2.26 \
      workflow-job:2.30 \
      workflow-multibranch:2.20 \
      workflow-scm-step:2.7 \
      workflow-step-api:2.17 \
      workflow-support:2.23 \
      ws-cleanup:0.36

ENV no_proxy gogs

# We really want this to run as the Jenkins user
# but for class it is challenging to get the docker socket
# permissions correct for every student, so we use root instead.
USER root
