
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
 