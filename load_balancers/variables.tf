variable "availability_zones" {
  # No spaces allowed between az names!
  default = "us-west-2a,us-west-2b,us-west-2c"
}

#
# From other modules
#
variable "public_subnet_id" {}
variable "webapp_http_inbound_sg_id" {}
