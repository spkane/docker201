Forked from: https://github.com/Praqma/terraform-aws-docker

# Terraform + AWS + Docker Swarm setup

Here is the basic setup to run up docker swarm cluster in AWS using the Terraform.
[Terraform](https://www.terraform.io) is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions. Using Terraform helps to create the infrastructure you can change and trace, safely and efficiently. A medium-sized swarm cluster will be created during startup. Three swarm managers and ten swarm workers. In the  *app-instances.tf* you will find the core configuration.

## Installation
Directions on how to install terraform can be found [here](https://www.terraform.io/intro/getting-started/install.html). Or you can using a Docker image to keep your environment clear. For example, [this one](https://hub.docker.com/r/amontaigu/terraform/).

## Preparations
### AWS account
If you don't have account, you may get a free AWS account. In the setup will be used free t2.micro instances.
#### SSH keys
Before you start, you need to create your ssh keys. Terraform will create a key-pair in AWS, based on these keys. See [how to create ssh keys](https://confluence.atlassian.com/bitbucketserver/creating-ssh-keys-776639788.html)
Create a .pem file with private ssh key you generated. Terraform will need to the .pem file to connect to instances for provisioning.
#### Update the project file with new information
There are three files that need your credentials to be successfully setup. First of all, update *key-pair.tf* and set the path to the public ssh key, generated earlier. In *variables.tf* update your AWS account information. In *app-instances.tf* update the connection block for each resource with the path to the ssh private key.

## How to use
After all configuration files are ready, you can do check to see if there are any mistakes.
```
terraform plan
```
This command will either show a syntax error or a list of resources that will be created. After this you can run:
```
terraform apply
```
This command will build and run all resources in the *.tf files. If you run this command many times, Terraform may destroy previous instances before creating new ones.

That is it. Now you have fully functioned docker swarm cluster in AWS.

If you want to terminate instances and destroy the configuration you may call:
```
terraform destroy
```
