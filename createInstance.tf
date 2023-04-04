provider "aws" {
    access_key = "AKIATCP27AVA5AKQRR2M"
    secret_key = "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"
    region  = "us-east-1"
}

data "aws_ami" "latest-amazon-linux-image" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "owner-alias"
        values = ["amazon"]
    }

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
}

output "ec2_instance_id" {
    value = aws_ami.latest-amazon-linux-image
}
# resource "aws_instance" "MyFirstInstance" {
#     ami = "	ami-0a561b65214a47cac"
#     instance_type = "t2.micro"
# }
 