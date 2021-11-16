# PowerX Fundamentals in Development tools - Homework 4
This homework involves utilising Terraform to create an EC2 instance which has port 22 only accessible from my own public IP address using a specific TLS key.
Terraform has been utilised to provision the following infrastructure:
- Creating the necessary s3 backend bucket
- EC2 instance where the app will be deployed to (and the security group)
- aws_key_pair referencing a tls_private_key

# End results
