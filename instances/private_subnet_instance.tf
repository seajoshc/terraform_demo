resource "aws_instance" "private_subnet_instance" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.small"
  tags = {
    Name = "terraform_demo_private_subnet"
  }
  subnet_id = "${var.private_subnet_id}"
  vpc_security_group_ids = [
    "${var.ssh_from_bastion_sg_id}",
    "${var.web_access_from_nat_sg_id}"
    ]
  key_name = "${var.key_name}"
}
