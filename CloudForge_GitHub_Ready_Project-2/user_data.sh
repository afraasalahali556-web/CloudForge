#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y nginx

cat > /var/www/html/index.html <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Group 4 - IaC & Automated Deployment</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; background: #f4f6f8; }
    .card { max-width: 760px; margin: 10vh auto; padding: 40px; background: white;
            border-radius: 16px; box-shadow: 0 8px 30px rgba(0,0,0,.08); }
    h1 { margin-top: 0; }
    .ok { padding: 12px 16px; background: #e8f5e9; border-radius: 8px; }
    code { background: #f1f1f1; padding: 2px 6px; border-radius: 4px; }
  </style>
</head>
<body>
  <div class="card">
    <h1>Group 4</h1>
    <h2>Infrastructure as Code & Automated Deployment</h2>
    <p class="ok">Deployment successful: this page is running on an AWS EC2 virtual machine.</p>
    <p>Infrastructure was provisioned using <strong>Terraform</strong>.</p>
    <p>Network: VPC + public subnet &nbsp;|&nbsp; Storage: S3 + encrypted EBS</p>
    <p>CI/CD: GitHub Actions</p>
  </div>
</body>
</html>
HTML

systemctl enable nginx
systemctl restart nginx
