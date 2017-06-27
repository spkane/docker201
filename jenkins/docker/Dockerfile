FROM jenkinsci/jenkins:2.65
USER root
RUN apt-get -y update && \
    apt-get -y install apt-transport-https \
      make && \
    curl -fsSL https://yum.dockerproject.org/gpg | apt-key add - && \
    apt-get -y install software-properties-common && \
    add-apt-repository \
      "deb https://apt.dockerproject.org/repo/ debian-$(lsb_release -cs) main" && \
    apt-get -y update && \
    apt-get -y install docker-engine && \
    gpasswd -a jenkins staff && \
    gpasswd -a jenkins users
USER jenkins
RUN /usr/local/bin/install-plugins.sh \
      ace-editor:1.1 \
      ant:1.5 \
      antisamy-markup-formatter:1.5 \
      authentication-tokens:1.3 \
      bouncycastle-api:2.16.1 \
      branch-api:2.0.10 \
      build-timeout:1.18 \
      cloudbees-folder:6.0.4 \
      credentials-binding:1.12 \
      credentials:2.1.14 \
      display-url-api:2.0 \
      docker-commons:1.7 \
      docker-workflow:1.12 \
      durable-task:1.14 \
      email-ext:2.57.2 \
      external-monitor-job:1.7 \
      git-client:2.4.6 \
      git-server:1.7 \
      git:3.3.0 \
      github-api:1.85.1 \
      github:1.27.0 \
      gogs-webhook:1.0.10 \
      gradle:1.26 \
      handlebars:1.1.1 \
      icon-shim:2.0.3 \
      jquery-detached:1.2.1 \
      junit:1.20 \
      ldap:1.15 \
      mailer:1.20 \
      mapdb-api:1.0.9.0 \
      mask-passwords:2.10.1 \
      matrix-auth:1.6 \
      matrix-project:1.11 \
      momentjs:1.1.1 \
      pam-auth:1.3 \
      pipeline-build-step:2.5 \
      pipeline-graph-analysis:1.4 \
      pipeline-input-step:2.7 \
      pipeline-milestone-step:1.3.1 \
      pipeline-model-api:1.1.6 \
      pipeline-model-declarative-agent:1.1.1 \
      pipeline-model-definition:1.1.6 \
      pipeline-rest-api:2.8 \
      pipeline-stage-step:2.2 \
      pipeline-stage-tags-metadata:1.1.6 \
      pipeline-stage-view:2.8 \
      plain-credentials:1.4 \
      resource-disposer:0.6 \
      scm-api:2.1.1 \
      script-security:1.29 \
      ssh-credentials:1.13 \
      ssh-slaves:1.20 \
      structs:1.8 \
      subversion:2.8 \
      timestamper:1.8.8 \
      token-macro:2.1 \
      windows-slaves:1.3.1 \
      workflow-aggregator:2.5 \
      workflow-api:2.17 \
      workflow-basic-steps:2.5 \
      workflow-cps-global-lib:2.8 \
      workflow-cps:2.36 \
      workflow-durable-task-step:2.12 \
      workflow-job:2.11 \
      workflow-multibranch:2.15 \
      workflow-scm-step:2.5 \
      workflow-step-api:2.11 \
      workflow-support:2.14 \
      ws-cleanup:0.33

