openssl
htpasswd (myuser - myuser-pw!)
docker login localhost:5000

cogs:
postgres server: postgres:5432
ssh port - 10022
http port - 3000
URL: http://localhost:10080/
Enable console mode
add user
create ssh key
add repo

mkdir -p ~/docker-class-201/postgres/data/data

Disk space

https://docs.docker.com/registry/insecure/#using-self-signed-certificates

cat ~/docker-class-201/jenkins/data/secrets/initialAdminPassword

jenkins - install custom plugins - select none - then install

create user

cp -a jenkins/jobs/outyet jenkins/data/jobs/


cp -a ./layout/outyet ./code/outyet
cd ./code/outyet
git add .
git commit -m "first commit"
git remote add origin ssh://git@localhost:10022/myuser/outyet.git
ssh-keygen -R [localhost]:10022
git push -u origin master

cogs:
 webhook:
  payload url: http://jenkins:8080/gogs-webhook/?job=outyet



* Day One
   * OVERVIEW
      * 10 minutes
         * Instructor will welcome the students and give a quick bio and overview of the class.
      * 10 minutes
         * Instructor will review prerequisites.
         * Students will complete prerequisites as needed.
       * 20 minutes
         * Instructor will provide a quick overview of Linux Containers, and Docker 
         * Instructor will lead students in quick overview of docker-machine.
         * Students will launch and test their Docker VM
         * Students will ask questions.
   * DOCKER COMPOSE
      * 10 minutes
         * Instructor will discuss the purpose of Docker Compose.
         * Instructor will review the components of a Docker Compose project file.
         * Students will download a git repo for class.
      * 5 minutes - BREAK
         * Student will take a break, or ask questions as they would like.
      * 20 minutes
         * Students will modify, deploy, and test a multi-container Docker Compose project.
   * DOCKER DISTRIBUTION	
      * 10 minutes
         * Instructor will discuss image repositories and what they do.
         * Students will download docker distribution
      * 30 minutes
         * Instructor will teach the students how to configure and deploy Docker Distribution.
         * Students will configure, deploy, and test Docker Distribution.
      * 5 minutes - BREAK
         * Student will take a break, or ask questions as they would like.
   * JENKINS - Part 1   (Jenkins workflow MIGHT be integrated with GitHub)
      * 15 minutes
         * Instructor will provide an overview of the testing tools ecosystem.
      * 10 minutes
         * Instructor will provide an overview of Jenkins and how it can be used with Docker
         * Students will download and launch the Jenkins Docker Compose project.
      * 20 minutes
         * Instructor will review the Jenkins UI, how it works, and what Jenkins plugins the project relies on
         * Students will follow along and with their individual Jenkins instances
      * 5 minutes
         * Students will stop their Jenkins instances.
      * 5 minutes
         * Instructor will review what was taught
      * 10 minutes
         * Students will ask any additional questions that they have.

* Day Two
   * JENKINS - Part 2	
      * 5 minutes
         * Instructor will quickly recap what was taught in the previous session.
      * 5 minutes
         * Student will re-start their Jenkins Docker Compose project.
      * 10 minutes
         * Instructor will provide an overview of the Docker-based project that we are going to build and test via Jenkins.
         * Students will download container project for testing.
      * 5 minutes - BREAK
         * Student will take a break, or ask questions as they would like.
      * 15 minutes
         * Instructor will describe the components and wiring needed to build a basic CI flow.
         * Students will follow along and piece together the individual steps of their CI flow.
      * 15 minutes
         * Everyone will run a build of a working code branch and test the resulting Docker container.
      * 15 minutes
         * Instructor will review a broken build and how we will use the CI workflow to automatically detect this after the code is committed.
         * Students will change to a git branch with a broken commit and try to build their project.
      * 15 minutes
         * Instructor will review the results of the failed build and discuss how to fix the project.
         * Students will commit a bug fix to their project and then resubmit their code to the CI flow.
      * 5 minutes 
         * Instructor quickly review the results on the testing.
         * Student will ask questions
      * 5 minutes - BREAK
         * Student will take a break, or ask questions as they would like.
   * DOCKER SWARM
      * 15 minutes
         * Instructor will provide an overview of the orchestration tools ecosystem.
      * 10 minutes 
         * Instructor will provide an overview of Docker Swarm and the various scheduling algorithms and constraints avaliable.
      * 10 minutes
         * Students will start 2 additional Virtual Machines and create their first Swarm cluster.
      * 10 minutes
         * Student will utilize Jenkins to deploy a working build to their Swarm cluster.
      * 15 Minutes
         * Students will, inspect, scale, and then delete their service.
      * 20 minutes
         * Instructor will discuss how to perform rolling updates and draining a node.
         * Students will modify Jenkins to deploy their service via a rolling update.
   * POSSIBLE TOPIC (Load Balancing)
         * Using HAProxy to provide VIPs for your services.
         * Clair security scanning
      * 15 minutes
         * Instructor will provide an overview of managing secrets w/ Docker Swarm
         * Students will modify their service to utilize secrets in Swarm.
      * 5 minutes
         * Instructor will review what was taught
      * 5 minutes
         * Students will ask any additional questions that they have.
