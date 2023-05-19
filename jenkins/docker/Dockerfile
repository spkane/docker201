FROM docker.io/jenkins/jenkins:2.405
USER root

RUN apt-get -y update && \
    apt -y remove \
      docker \
      docker.io \
      containerd \
      runc && \
    apt-get -y install \
      ca-certificates \
      curl \
      gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | \
      gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get -y update && \
    apt-get -y install \
      docker-ce \
      docker-ce-cli \
      containerd.io \
      docker-buildx-plugin \
      docker-compose-plugin && \
    gpasswd -a jenkins staff && \
    gpasswd -a jenkins users && \
    gpasswd -a jenkins docker && \
    apt-get clean

USER jenkins

# Get from a running Jenkins: http://127.0.0.1:8080/script
# Jenkins.instance.pluginManager.plugins.each{plugin -> println ("${plugin.getShortName()}:${plugin.getVersion()}")}
# We add `embeddable-build-status`, `gogs-webhook` and `mask-passwords` to the defaults
RUN jenkins-plugin-cli --plugins \
    ant:487.vd79d090d4ea_e \
    antisamy-markup-formatter:159.v25b_c67cd35fb_ \
    apache-httpcomponents-client-4-api:4.5.14-150.v7a_b_9d17134a_5 \
    bootstrap5-api:5.2.2-3 \
    bouncycastle-api:2.27 \
    branch-api:2.1092.vda_3c2a_a_f0c11 \
    build-timeout:1.30 \
    caffeine-api:3.1.6-115.vb_8b_b_328e59d8 \
    checks-api:2.0.0 \
    cloudbees-folder:6.815.v0dd5a_cb_40e0e \
    commons-lang3-api:3.12.0-36.vd97de6465d5b_ \
    commons-text-api:1.10.0-36.vc008c8fcda_7b_ \
    credentials-binding:604.vb_64480b_c56ca_ \
    credentials:1254.vb_96f366e7b_a_d \
    display-url-api:2.3.7 \
    durable-task:507.v050055d0cb_dd \
    echarts-api:5.4.0-3 \
    email-ext:2.97 \
    embeddable-build-status:369.vb_a_68a_575a_b_11 \
    font-awesome-api:6.3.0-2 \
    git-client:4.2.0 \
    git:5.0.2 \
    github-api:1.314-431.v78d72a_3fe4c3 \
    github-branch-source:1703.vd5a_2b_29c6cdc \
    github:1.37.1 \
    gogs-webhook:1.0.15 \
    gradle:2.7 \
    instance-identity:142.v04572ca_5b_265 \
    ionicons-api:45.vf54fca_5d2154 \
    jackson2-api:2.15.1-344.v6eb_55303dc3e \
    jakarta-activation-api:2.0.1-3 \
    jakarta-mail-api:2.0.1-3 \
    javax-activation-api:1.2.0-6 \
    javax-mail-api:1.6.2-9 \
    jaxb:2.3.8-1 \
    jjwt-api:0.11.5-77.v646c772fddb_0 \
    jquery3-api:3.6.4-1 \
    junit:1202.v79a_986785076 \
    ldap:682.v7b_544c9d1512 \
    mailer:448.v5b_97805e3767 \
    mask-passwords:150.vf80d33113e80 \
    matrix-auth:3.1.7 \
    matrix-project:789.v57a_725b_63c79 \
    mina-sshd-api-common:2.10.0-69.v28e3e36d18eb_ \
    mina-sshd-api-core:2.10.0-69.v28e3e36d18eb_ \
    okhttp-api:4.10.0-132.v7a_7b_91cef39c \
    pam-auth:1.10 \
    pipeline-build-step:491.v1fec530da_858 \
    pipeline-github-lib:42.v0739460cda_c4 \
    pipeline-graph-analysis:202.va_d268e64deb_3 \
    pipeline-groovy-lib:656.va_a_ceeb_6ffb_f7 \
    pipeline-input-step:468.va_5db_051498a_4 \
    pipeline-milestone-step:111.v449306f708b_7 \
    pipeline-model-api:2.2131.vb_9788088fdb_5 \
    pipeline-model-definition:2.2131.vb_9788088fdb_5 \
    pipeline-model-extensions:2.2131.vb_9788088fdb_5 \
    pipeline-rest-api:2.32 \
    pipeline-stage-step:305.ve96d0205c1c6 \
    pipeline-stage-tags-metadata:2.2131.vb_9788088fdb_5 \
    pipeline-stage-view:2.32 \
    plain-credentials:143.v1b_df8b_d3b_e48 \
    plugin-util-api:3.2.1 \
    resource-disposer:0.22 \
    scm-api:672.v64378a_b_20c60 \
    script-security:1244.ve463715a_f89c \
    snakeyaml-api:1.33-95.va_b_a_e3e47b_fa_4 \
    ssh-credentials:305.v8f4381501156 \
    ssh-slaves:2.877.v365f5eb_a_b_eec \
    sshd:3.303.vefc7119b_ec23 \
    structs:324.va_f5d6774f3a_d \
    timestamper:1.25 \
    token-macro:359.vb_cde11682e0c \
    trilead-api:2.84.v72119de229b_7 \
    variant:59.vf075fe829ccb \
    workflow-aggregator:596.v8c21c963d92d \
    workflow-api:1213.v646def1087f9 \
    workflow-basic-steps:1017.vb_45b_302f0cea_ \
    workflow-cps:3659.v582dc37621d8 \
    workflow-durable-task-step:1246.v5524618ea_097 \
    workflow-job:1295.v395eb_7400005 \
    workflow-multibranch:746.v05814d19c001 \
    workflow-scm-step:408.v7d5b_135a_b_d49 \
    workflow-step-api:639.v6eca_cd8c04a_a_ \
    workflow-support:839.v35e2736cfd5c \
    ws-cleanup:0.45

ENV no_proxy gogs

# We really want this to run as the Jenkins user
# but for class it is challenging to get the docker socket
# permissions correct for every student, so we use root instead.
USER root
