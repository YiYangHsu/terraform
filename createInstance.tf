
data "aws_ami" "latest-amazon-linux-image" {
    most_recent = true

    # filter {
    #     name = "name"
    #     values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-20.08-amd64-server-*"]
    # }

    # filter {
    #     name = "virtualization - type"
    #     vaules = ["hvm"]
    # }

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
    value = data.aws_ami.latest-amazon-linux-image.id
}
resource "aws_instance" "MyFirstInstance" {

    ami = data.aws_ami.latest-amazon-linux-image.id
    # ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"

    tags = {
        Name = "custom_instance"
    }


}




