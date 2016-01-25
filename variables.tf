variable "region" {
  default = "us-west-2"
}
variable "ip_range" {
  default = "0.0.0.0/0" # Change to your IP Range!
}
variable "availability_zones" {
  # No spaces allowed between az names!
  default = "us-west-2a,us-west-2b,us-west-2c"
}
variable "key_name" {}
variable "instance_type" {
  default = "t2.nano"
}
variable "asg_min" {
  default = "2"
}
variable "asg_max" {
  default = "5"
}
variable "asg_desired" {
  default = "2"
}
# Amazon Linux AMI
# Most recent as of 2015-12-02
variable "amis" {
  default = {
    us-east-1 = "ami-60b6c60a"
    us-west-2 = "ami-f0091d91"
  }
}
variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}
variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}
