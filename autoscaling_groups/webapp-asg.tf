resource "aws_autoscaling_group" "webapp_asg" {
  # availability_zones = ["${split(",", var.availability_zones)}"]
  vpc_zone_identifier = ["${var.public_subnet_id}"]
  name = "demo_webapp_asg"
  max_size = "${var.asg_max}"
  min_size = "${var.asg_min}"
  desired_capacity = "${var.asg_desired}"
  force_delete = true # what's this do?
  launch_configuration = "${var.webapp_lc_id}"
  load_balancers = ["${var.webapp_elb_name}"]
  tag {
    key = "Name"
    value = "terraform_asg"
    propagate_at_launch = "true"
  }
}

output "asg_id" {
  value = "${aws_autoscaling_group.webapp_asg.id}"
}
