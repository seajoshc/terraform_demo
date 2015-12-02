output "http_inbound_security_group" {
  value = "${aws_security_group.webapp-http-inbound-sg.id}"
}

output "ssh_inbound_security_group" {
  value = "${aws_security_group.webapp-ssh-inbound-sg.id}"
}

output "outbound_security_group" {
  value = "${aws_security_group.webapp-outbound-sg.id}"
}

output "launch_configuration" {
  value = "${aws_launch_configuration.webapp-lc.id}"
}

output "asg_name" {
  value = "${aws_autoscaling_group.webapp-asg.id}"
}

output "elb_name" {
  value = "${aws_elb.webapp-elb.dns_name}"
}
