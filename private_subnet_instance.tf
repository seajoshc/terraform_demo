resource "aws_instance" "private_subnet_instance" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.small"
  tags = {
    Name = "demo_private_subnet"
  }
  subnet_id = "${aws_subnet.demo-private.id}"
  vpc_security_group_ids = [
    "${aws_security_group.ssh-from-bastion-sg.id}",
    "${aws_security_group.web-access-from-nat-sg.id}"
    ]
  key_name = "${var.key_name}"
}
