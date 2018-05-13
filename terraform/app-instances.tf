/* Setup our aws provider */
provider "aws" {
  profile  = "${var.aws_profile}"
  region   = "us-east-1"
}

data "external" "public_ip" {
  program = ["./bin/local-ip.sh"]
}

resource "aws_instance" "manager" {
  count         = "${var.swarm_manager_count}"
  ami           = "ami-835d69f8"
  instance_type = "m4.large"
  security_groups = ["${aws_security_group.swarm.name}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  connection {
    user = "ubuntu"
    private_key = "${file(var.ssh_private_key_path)}"
  }
  provisioner "file" {
    source = "./etc-default-docker"
    destination = "/tmp/etc-default-docker"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce",
      "sudo cp /tmp/etc-default-docker /etc/default/docker",
      "sudo service docker restart",
      "sudo usermod -aG docker ubuntu",
    ]
  }
  tags = {
    Name = "swarm-manager-${count.index}-skane"
    Trainer = "Sean P. Kane"
  }
}

resource "aws_instance" "worker" {
  count         = "${var.swarm_worker_count}"
  ami           = "ami-835d69f8"
  instance_type = "m4.large"
  security_groups = ["${aws_security_group.swarm.name}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  connection {
    user = "ubuntu"
    private_key = "${file(var.ssh_private_key_path)}"
  }
  provisioner "file" {
    source = "${var.ssh_private_key_path}"
    destination = "/home/ubuntu/key.pem"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce",
      "sudo chmod 400 /home/ubuntu/key.pem",
      "sudo usermod -aG docker ubuntu",
    ]
  }
  tags = {
    Name = "swarm-worker-${count.index}-skane"
    Trainer = "Sean P. Kane"
  }
}
