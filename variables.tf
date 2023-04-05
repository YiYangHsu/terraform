variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-1"
}

variable "Security_Group" {
    type = list
    default = ["sg-24076", "sg-90890", "sg-456789"]
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0ac59804e0c10a625"
        us-east-2 = "ami-0a561b65214a47cac"
    }
}