/* Setup our aws provider */
provider "aws" {
  profile  = var.aws_profile
  region   = "us-east-1"
}

data "external" "public_ip" {
  program = ["./bin/local-ip.sh"]
}

resource "aws_instance" "manager" {
  count         = var.swarm_manager_count
  ami           = "ami-5c66ea23"
  instance_type = "m4.large"
  security_groups = [aws_security_group.swarm.name]
  key_name = aws_key_pair.deployer.key_name
  connection {
    host = self.public_ip
    user = "ubuntu"
    private_key = file(var.ssh_private_key_path)
  }
  provisioner "file" {
    source = "./files/startup_options.conf"
    destination = "/tmp/startup_options.conf"
  }
  provisioner "file" {
    source = "./files/daemon.json"
    destination = "/tmp/daemon.json"
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
      "sudo usermod -aG docker ubuntu",
      "wget https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc",
      "chmod +x runsc",
      "sudo mv runsc /usr/local/bin",
      "sudo cp /tmp/daemon.json /etc/docker/daemon.json",
      "sudo mkdir -p /etc/systemd/system/docker.service.d/",
      "sudo cp /tmp/startup_options.conf /etc/systemd/system/docker.service.d/startup_options.conf",
      "sudo systemctl daemon-reload",
      "sudo service docker restart",
    ]
  }
  tags = {
    Name = "swarm-manager-${count.index}-spkane"
    Trainer = "Sean P. Kane"
  }
}

resource "aws_instance" "worker" {
  count         = var.swarm_worker_count
  ami           = "ami-5c66ea23"
  instance_type = "m4.large"
  security_groups = [aws_security_group.swarm.name]
  key_name = aws_key_pair.deployer.key_name
  connection {
    host = self.public_ip
    user = "ubuntu"
    private_key = file(var.ssh_private_key_path)
  }
  provisioner "file" {
    source = var.ssh_private_key_path
    destination = "/home/ubuntu/key.pem"
  }
  provisioner "file" {
    source = "./files/daemon.json"
    destination = "/tmp/daemon.json"
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
      "wget https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc",
      "chmod +x runsc",
      "sudo mv runsc /usr/local/bin",
      "sudo cp /tmp/daemon.json /etc/docker/daemon.json",
      "sudo systemctl restart docker",
    ]
  }
  tags = {
    Name = "swarm-worker-${count.index}-spkane"
    Trainer = "Sean P. Kane"
  }
}
