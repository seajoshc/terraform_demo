resource "aws_instance" "bastion" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.medium"
  tags = {
    Name = "bastion"
  }
  subnet_id = "${aws_subnet.demo-public.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.bastion-ssh-sg.id}"]
  key_name = "${var.key_name}"
}

resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc = true
}
