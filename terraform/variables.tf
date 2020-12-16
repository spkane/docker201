variable "aws_profile" {
   description = "AWS Profile for credentials"
    default = "oreilly-aws"
}

variable "ssh_private_key_path" {
   description = "Path to EC2 SSH private key"
    default = "/Users/spkane/.ssh/oreilly_aws"
}

variable "ssh_public_key_path" {
   description = "Path to EC2 SSH public key"
    default = "/Users/spkane/.ssh/oreilly_aws.pub"
}

#variable "public_ip_path" {
#   description = "Path to file containing public IP"
#    default = "/Users/spkane/.public_home_ip"
#}

variable "swarm_manager_count" {
   description = "Number of swarm managers"
    default = 3
}

variable "swarm_worker_count" {
   description = "Number of swarm workers"
    default = 4
}

