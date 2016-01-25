resource "aws_instance" "bastion" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  tags = {
    Name = "terraform_bastion"
  }
  subnet_id = "${var.public_subnet_id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.bastion_ssh_sg_id}"]
  key_name = "${var.key_name}"
}

resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc = true
}
