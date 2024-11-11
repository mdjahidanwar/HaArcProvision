Final Folder Structure
Here’s the final folder structure, including the main.tf, variables.tf, outputs.tf, provider.tf, and module folders:


├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── modules/
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security_group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── redis/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── route53/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── cloudfront/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── global_accelerator/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── eks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf




# AWS Infrastructure Setup with Terraform

This repository contains Terraform configurations to provision infrastructure for a global application, including EC2, IAM roles, CloudFront, Global Accelerator, Redis, Route 53, S3, RDS, and EKS.

## Prerequisites

- Terraform v1.0 or later
- AWS CLI installed and configured
- AWS Account with proper IAM permissions

## Install AWS CLI

1. **Install AWS CLI**

   To install the AWS CLI, follow the instructions for your operating system:

   - **Linux (Ubuntu/Debian)**:

     ```bash
     sudo apt update
     sudo apt install awscli -y
     ```

   - **macOS (Homebrew)**:

     ```bash
     brew install awscli
     ```
     - **Windows:**

     Download and install the AWS CLI from [here](https://aws.amazon.com/cli/).

2. **Configure AWS CLI**

   Once installed, you can configure the AWS CLI with the following command:

   ```bash
   aws configure
AWS Access Key ID [None]: <your-access-key>
AWS Secret Access Key [None]: <your-secret-key>
Default region name [None]: us-west-2
Default output format [None]: json
You can also configure the AWS CLI by exporting environment variables or using named profiles.


## Install Terraform
To install Terraform, you can use the following commands:

Linux (Ubuntu/Debian):
sudo apt-get update
sudo apt-get install -y wget unzip
wget https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
unzip terraform_1.1.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/

MacOS (Homebrew):
brew install terraform

Windows:
Download and install Terraform following official doc.


## Usage

### 1. Initialize Terraform
terraform init

### 2. Plan the Deployment
terraform plan

### 3. Apply the Configuration
terraform apply

### 4. Destroy the Infrastructure
terraform destroy
