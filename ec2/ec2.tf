resource "aws_instance" "EC2_1" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name      = "N-VIRIGINIA-Laptop-Filipe"
  subnet_id     = aws_subnet.Subnet1.id

  vpc_security_group_ids  = [
    aws_security_group.SG1.id,
  ]

    user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
              sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
              EOF
  tags = {
    Name = "Kubernetes-EC2-1"
  }
}