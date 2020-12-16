/* Default security group */
resource "aws_security_group" "swarm" {
  name = "swarm-training-spkane"
  description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["${data.external.public_ip.result.public_ip}/32"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["${data.external.public_ip.result.public_ip}/32"]
  }

    ingress {
    from_port = 2375
    to_port   = 2375
    protocol  = "tcp"
    cidr_blocks = ["${data.external.public_ip.result.public_ip}/32"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  egress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "swarm-training-spkane"
    Trainer = "Sean P. Kane"
  }
}
