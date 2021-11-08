variable "name" {
	type = string
	default = "cwdevtoolshw4"
}

data "terraform_remote_state" "app_servers_state" {
	backend = "s3"
  config = {
    region = "ap-southeast-1"
    bucket = "cwdevtoolshw4"
    key = "hw4.tfstate"
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

locals {
  private_ips_in_cidr_form = [for ip in data.terraform_remote_state.app_servers_state.outputs.instance_private_ips : "${ip}/32"]
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = data.terraform_remote_state.app_servers_state.config.bucket
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_security_group" "allow_app_servers" {
	name = "allow-port-22"
  vpc_id = data.aws_vpc.default_vpc.id

	ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = local.private_ips_in_cidr_form
	}
}

resource "aws_instance" "cw-hw4" {
	ami = "ami-0f511ead81ccde020"
	instance_type = "t2.micro"

	tags = {
		Name = var.name
	}
}

output "instance_ips" {
	value = [aws_instance.cw-hw4.public_ip]
}

output "instance_ids" {
	value = [aws_instance.cw-hw4.id]
}