# PowerX Fundamentals in Development tools - Homework 4
This homework involves utilising Terraform to create an EC2 instance which has port 22 only accessible from my own public IP address using a specific TLS key.
Terraform has been utilised to provision the following infrastructure:
- Creating the necessary s3 backend bucket
- EC2 instance where the app will be deployed to (and the security group)
- aws_key_pair referencing a tls_private_key

# End results
s3 Buckets:

![image](https://user-images.githubusercontent.com/72724926/141986157-890ec779-940c-4850-a085-9f764a122d85.png)

EC2 instance:

![image](https://user-images.githubusercontent.com/72724926/141986281-e6ed6ca3-8008-4c98-a0e6-89f0aa939162.png)

Security groups and SSH access:

![image](https://user-images.githubusercontent.com/72724926/141986833-ca316375-d271-45e5-b71b-3d6728e369a9.png)

