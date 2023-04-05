variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-2"
}

variable "Security_Group" {
    type = list
    default = ["sg-24076", "sg-90890", "sg-456789"]
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0f40c8f97004632f9"
        us-east-2 = "ami-05692172625678b4e"
    }
}

variable "PATH_TOPRIVATE_KEY" {
    default = "levelup_key"
}

variable "PATH_TO_PUBLICKEY" {
    default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}