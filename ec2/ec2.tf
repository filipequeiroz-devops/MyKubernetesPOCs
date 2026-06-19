resource "aws_instance" "EC2_1" {
  ami                  = "ami-0b6d9d3d33ba97d99" #ubuntu ami
  instance_type        = "t2.medium"
  key_name             = "N-VIRIGINIA-Laptop-Filipe"
  subnet_id            = aws_subnet.Subnet1.id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  vpc_security_group_ids = [
    aws_security_group.SG1.id,
  ]

  #EBS configuration for the root volume
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true

    tags = {
      Name = "Kubernetes-EC2-1-Disk"
    }
  }

  #script for installing K3s and Minikube on the EC2 instance. This script will run when the instance is launched.
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              
              # Instala o K3s. Este script baixa, instala e já inicia o serviço em background.
              curl -sfL https://get.k3s.io | sh -
              
              # Configura as permissões para o usuário padrão (ubuntu) conseguir usar o kubectl sem sudo
              sudo chmod 644 /etc/rancher/k3s/k3s.yaml
              echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> /home/ubuntu/.bashrc
              
              # Opcional: cria um alias "kubectl"
              echo "alias kubectl='k3s kubectl'" >> /home/ubuntu/.bashrc

              # Instala o Docker (O Minikube usa o Docker como "driver" para criar o cluster)
              sudo apt-get install -y docker.io curl apt-transport-https conntrack
              sudo systemctl enable docker
              sudo systemctl start docker

              # Dá permissão para o usuário padrão (ubuntu) usar o Docker sem sudo
              sudo usermod -aG docker ubuntu

              # Instala o Minikube
              curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
              sudo install minikube-linux-amd64 /usr/local/bin/minikube

              # Inicia o Minikube
              # O user_data roda como root, mas o Minikube proíbe rodar como root por segurança.
              # O comando 'su - ubuntu -c' força a execução como o usuário ubuntu.
              su - ubuntu -c "minikube start --driver=docker"

              EOF
  tags = {
    Name = "Kubernetes-EC2-1"
  }
}

#Role created in ec2_roles.tf file
resource "aws_iam_instance_profile" "EC2_Instance_Profile" {
  name = "EC2_Instance_Profile"
  role = aws_iam_role.EC2_Role.name
}