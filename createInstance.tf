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

# output "ec2_instance_id" {
#     value = data.aws_ami.latest-amazon-linux-image.id
# }
resource "aws_instance" "MyFirstInstance" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = "t2.micro"
}
 