# CloudForge — Infrastructure as Code & Automated Deployment

## Project idea

This project demonstrates Infrastructure as Code (IaC) and DevOps automation using:

- **Terraform** — writes and manages cloud infrastructure as code.
- **AWS VPC** — network infrastructure.
- **AWS EC2** — virtual machine.
- **AWS S3** — cloud storage.
- **GitHub** — source-code repository.
- **GitHub Actions** — simple CI/CD automation.

Architecture:

```text
Terraform Code
      |
      v
Cloud Infrastructure
   /      |       \
Network  VM      Storage
(VPC)   (EC2)     (S3)
      |
      v
GitHub -> GitHub Actions -> Automated Deployment
```

## What is created

1. VPC: `10.0.0.0/16`
2. Public subnet: `10.0.1.0/24`
3. Internet Gateway and public route table
4. Security Group allowing HTTP/80
5. Ubuntu 24.04 EC2 instance (`t3.micro` by default)
6. Encrypted 8 GB GP3 EBS root volume
7. Private/versioned S3 bucket
8. Nginx web server installed automatically by cloud-init/user data
9. GitHub Actions workflow for Terraform validation, plan, and deployment

## Run locally

### 1. Install
- Terraform >= 1.6
- AWS CLI
- An AWS account with permission to create the resources in this project

### 2. Configure AWS credentials

Use your normal AWS CLI/profile configuration, for example:

```bash
aws configure
```

Do not put AWS keys in Terraform files or commit them to GitHub.

### 3. Create your variables file

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit the values if required.

### 4. Initialize Terraform

```bash
terraform init
```

### 5. Check the configuration

```bash
terraform fmt -recursive
terraform validate
```

### 6. Preview changes

```bash
terraform plan
```

### 7. Create the cloud infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

### 8. Open the deployed website

After deployment:

```bash
terraform output -raw website_url
```

Copy the displayed URL into a browser.

## Modify the infrastructure

For example, change the EC2 type in `terraform.tfvars`:

```hcl
instance_type = "t3.micro"
```

Or change the network CIDR in `main.tf`, then run:

```bash
terraform plan
terraform apply
```

Terraform compares the desired configuration with the real infrastructure and applies the required changes.

## GitHub Actions CI/CD

Put the project in a GitHub repository with the same structure.

Add these repository secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

The workflow at `.github/workflows/terraform.yml` will:

1. Checkout the repository.
2. Install Terraform.
3. Run `terraform init`.
4. Run `terraform fmt -check`.
5. Run `terraform validate`.
6. Run `terraform plan` on pull requests.
7. Run `terraform apply -auto-approve` when changes are pushed to `main`.

### Important

The workflow can create AWS resources and therefore may generate AWS charges. Use an AWS account/budget appropriate for a student project and destroy the resources when finished:

```bash
terraform destroy
```

## Suggested demonstration

During the presentation:

1. Show `main.tf`.
2. Explain VPC/network, EC2/VM and S3/storage.
3. Run `terraform init`.
4. Run `terraform validate`.
5. Run `terraform plan`.
6. Run `terraform apply`.
7. Open the `website_url`.
8. Change one Terraform value.
9. Push to GitHub.
10. Show the GitHub Actions workflow running.
11. Show the deployment result.
12. Finish with `terraform destroy` when the demo is complete.

## Learning outcomes

By completing this project, the group demonstrates:

- Infrastructure as Code
- Repeatable cloud provisioning
- Basic cloud networking
- Virtual machine provisioning
- Cloud storage provisioning
- Infrastructure modification through code
- Git/GitHub workflow
- Basic CI/CD automation

## Official references

- Terraform AWS Provider: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- AWS EC2 resource: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
- AWS S3 resource: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
- GitHub Actions documentation: https://docs.github.com/en/actions


## Upload to GitHub — Quick Steps

1. Create a new GitHub repository named `CloudForge`.
2. Upload all files and folders from this project.
3. Make sure `.github/workflows/terraform.yml` is uploaded.
4. In GitHub open **Settings → Secrets and variables → Actions**.
5. Add these repository secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION`.
6. Push a change to the `main` branch or run the workflow manually from **Actions**.
7. Open the workflow run to show Terraform validation and deployment.

> Never upload `terraform.tfvars` if it contains secrets. The included `terraform.tfvars.example` is safe as a template.
