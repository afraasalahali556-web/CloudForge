output "vpc_id" {
  description = "Created VPC ID."
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Created public subnet ID."
  value       = aws_subnet.public.id
}

output "s3_bucket_name" {
  description = "Created private S3 bucket name."
  value       = aws_s3_bucket.app_storage.bucket
}

output "instance_id" {
  description = "Created EC2 instance ID."
  value       = aws_instance.web.id
}

output "website_url" {
  description = "HTTP URL of the demo web server."
  value       = "http://${aws_instance.web.public_ip}"
}
