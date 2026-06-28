# Kubernetes AND EKS POCs

**Language / Idioma**: [🇺🇸 English](#-project-overview) | [🇧🇷 Português](#-visão-geral-do-projeto)


<div align="center">

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Amazon S3](https://img.shields.io/badge/Amazon%20S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)
![CI/CD](https://github.com/filipequeiroz-devops/self-psico.com.br/actions/workflows/deploy.yaml/badge.svg)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
</div>

## 🇺🇸 Project Overview
This repository contains the Terraform files used to manage my AWS infrastructure, designed to support my hands-on learning with Kubernetes and Amazon EKS.

### What was implemented:
*   **Infrastructure as Code:** Architected AWS resources by importing existing assets and provisioning new ones via Terraform.
*   **CI/CD Pipeline:** Automated Terraform testing, linting, and validation using GitHub Actions.
*   **Storage & Deployment:** Configured an S3 bucket to store and sync YAML manifests, which are deployed to EC2 instances for Kubernetes Proof of Concepts (POCs).

---

## 🇺🇸 Visão Geral do Projeto
Este repositório contém os arquivos do Terraform utilizados para gerenciar minha infraestrutura na AWS, projetada para apoiar meu aprendizado prático com Kubernetes e Amazon EKS.

### O que foi implementado:
*   **Infraestrutura como Código (IaC):** Estruturação de recursos da AWS, envolvendo a importação de ativos existentes e o provisionamento de novos recursos via Terraform.
*   **Pipeline de CI/CD:** Automação de testes, *linting* e validação do Terraform utilizando o GitHub Actions.
*   **Armazenamento e Implantação:** Configuração de um bucket S3 para armazenar e sincronizar manifestos YAML, que são implantados em instâncias EC2 para a realização de Provas de Conceito (POCs) com Kubernetes.


<div align="center">
  <sub>Developed by **Filipe Queiroz** as part of a DevOps & SRE Career Transition Portfolio.</sub>
</div>