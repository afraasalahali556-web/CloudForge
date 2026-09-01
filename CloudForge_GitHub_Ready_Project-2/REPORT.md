# CloudForge — Infrastructure as Code & Automated Deployment

## 1. Introduction

The project demonstrates how cloud infrastructure can be defined and managed as code instead of being created manually through a cloud console. Terraform is used as the Infrastructure as Code tool, AWS is used as the cloud platform, and GitHub Actions provides a simple CI/CD pipeline.

## 2. Objectives

- Write a Terraform configuration.
- Automatically create cloud resources.
- Demonstrate network, compute and storage resources.
- Modify infrastructure through code.
- Store the project in GitHub.
- Implement a simple automated deployment workflow using GitHub Actions.

## 3. Architecture

Terraform code provisions an AWS VPC, public subnet, Internet Gateway, route table, security group, EC2 virtual machine and private versioned S3 bucket.

The EC2 machine automatically installs Nginx using `user_data` and displays a simple project webpage.

GitHub Actions validates Terraform and performs deployment when code is pushed to the `main` branch.

## 4. Components

### Terraform
Terraform describes the desired infrastructure state in `.tf` files. Running `plan` previews changes and `apply` creates or updates resources.

### Network
The VPC uses CIDR `10.0.0.0/16`. A public subnet uses `10.0.1.0/24`, with an Internet Gateway and public route.

### Virtual Machine
An Ubuntu 24.04 EC2 instance is created with a `t3.micro` instance type by default. The root EBS volume is encrypted.

### Storage
An S3 bucket is created as private storage with versioning enabled.

### GitHub
The source code is stored in a GitHub repository.

### GitHub Actions
A workflow automatically runs Terraform formatting and validation. Pull requests receive a plan, while pushes to `main` can execute the deployment.

## 5. Implementation steps

1. Install Terraform and configure AWS credentials.
2. Create `terraform.tfvars`.
3. Run `terraform init`.
4. Run `terraform fmt`.
5. Run `terraform validate`.
6. Run `terraform plan`.
7. Run `terraform apply`.
8. Copy the output website URL into a browser.
9. Change infrastructure configuration and run `plan/apply` again.
10. Push the project to GitHub.
11. Configure GitHub repository secrets.
12. Demonstrate GitHub Actions.
13. Destroy the resources after the demonstration.

## 6. Expected result

The final result is a working web page running on an AWS EC2 virtual machine, with the surrounding network and storage infrastructure created by Terraform. GitHub Actions provides an automated path from source-code changes to infrastructure deployment.

## 7. Conclusion

The project demonstrates the main idea of modern DevOps: infrastructure can be version-controlled, reviewed, validated and deployed automatically. Terraform provides repeatable infrastructure management, while GitHub Actions connects code changes to an automated deployment process.
