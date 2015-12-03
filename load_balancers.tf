resource "aws_elb" "webapp-elb" {
  name = "demo-webapp-elb"

  # availability_zones = ["${split(",", var.availability_zones)}"]
  subnets = ["${aws_subnet.demo-public.id}"]

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

  security_groups = ["${aws_security_group.webapp-http-inbound-sg.id}"]
}
