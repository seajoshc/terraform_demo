provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "webapp-http-inbound-sg" {
  name = "demo-webapp-http-inbound"
  description = "Allow HTTP from Anywhere"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "webapp-ssh-inbound-sg" {
  name = "demo-webapp-ssh-inbound"
  description = "Allow SSH from certain ranges"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ip_range}"]
  }
}

resource "aws_security_group" "webapp-outbound-sg" {
  name = "demo-webapp-outbound"
  description = "Allow outbound connections"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "webapp-elb" {
  name = "demo-webapp-elb"

  availability_zones = ["${split(",", var.availability_zones)}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 10
  }
}

resource "aws_launch_configuration" "webapp-lc" {
  name = "demo-webapp-lc"
  image_id = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  security_groups = [
    "${aws_security_group.webapp-http-inbound-sg.name}",
    "${aws_security_group.webapp-ssh-inbound-sg.name}",
    "${aws_security_group.webapp-outbound-sg.name}"
  ]
  user_data = "${file("userdata.sh")}"
  key_name = "${var.key_name}"
}

resource "aws_autoscaling_group" "webapp-asg" {
  availability_zones = ["${split(",", var.availability_zones)}"]
  name = "demo-webapp-asg"
  max_size = "${var.asg_max}"
  min_size = "${var.asg_min}"
  desired_capacity = "${var.asg_desired}"
  force_delete = true # what's this do?
  launch_configuration = "${aws_launch_configuration.webapp-lc.name}"
  load_balancers = ["${aws_elb.webapp-elb.name}"]
  tag {
    key = "Name"
    value = "webapp-asg"
    propagate_at_launch = "true" # what's this do?
  }
}
