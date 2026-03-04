# Terraform AWS Infrastructure with GitLab CI/CD Pipeline

A DevOps project that automates the deployment of AWS infrastructure using Terraform and GitLab CI/CD pipelines.

## 📋 Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup](#setup)
- [CI/CD Pipeline](#cicd-pipeline)
- [Usage](#usage)

---

## Overview

This project provisions AWS infrastructure using Terraform and automates the deployment process through a GitLab CI/CD pipeline. It includes a VPC, EC2 instances, security groups, and an S3 backend for storing Terraform state.

---

## Architecture

- **VPC** – Custom Virtual Private Cloud with subnets and security groups
- **EC2** – Web server instances deployed inside the VPC
- **S3 Backend** – Remote Terraform state stored in an S3 bucket
- **GitLab CI/CD** – Automated pipeline for validate, plan, and apply stages

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- AWS Account with IAM credentials
- GitLab account
- AWS CLI configured

---

## Project Structure

```
terraform/
├── main.tf               # Root module - calls VPC and EC2 modules
├── variables.tf          # Input variables
├── provider.tf           # AWS provider configuration
├── backend.tf            # S3 remote backend configuration
├── .terraform.lock.hcl   # Dependency lock file
├── .gitlab-ci.yml        # GitLab CI/CD pipeline definition
├── .gitignore            # Files to ignore in version control
├── vpc/                  # VPC module
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── web/                  # EC2 module
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

---

## Setup

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/terraform-aws.git
cd terraform-aws
```

### 2. Configure AWS credentials in GitLab
Go to **GitLab → Settings → CI/CD → Variables** and add:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

### 3. Initialize Terraform locally (optional)
```bash
terraform init
terraform plan
```

---

## CI/CD Pipeline

The `.gitlab-ci.yml` defines the following stages:

| Stage | Job | Description |
|-------|-----|-------------|
| `validate` | `validate_job` | Runs `terraform validate` to check syntax |
| `plan` | `plan_job` | Runs `terraform plan` to preview changes |
| `apply` | `apply_job` | Runs `terraform apply` to deploy infrastructure |
| `destroy` | `destroy_job` | Runs `terraform destroy` (manual trigger) |

The pipeline uses the official GitLab Terraform Docker image:
```
registry.gitlab.com/gitlab-org/gitlab-build-images:terraform
```

---

## Usage

### Trigger a deployment
Push to the `main` or `dev` branch to trigger the pipeline automatically:
```bash
git add .
git commit -m "update infrastructure"
git push origin main
```

### Destroy infrastructure
Trigger the `destroy` job manually from the GitLab pipeline UI.

---

## Author

**Suhaan Refai**  
[GitHub](https://github.com/suhaanrefai25) | [GitLab](https://gitlab.com/suhaangitlab1)
