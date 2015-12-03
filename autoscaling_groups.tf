resource "aws_autoscaling_group" "webapp-asg" {
  # availability_zones = ["${split(",", var.availability_zones)}"]
  vpc_zone_identifier = ["${aws_subnet.demo-public.id}"]
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
