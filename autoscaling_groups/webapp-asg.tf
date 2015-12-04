resource "aws_autoscaling_group" "webapp_asg" {
  lifecycle { create_before_destroy = true }
  vpc_zone_identifier = ["${var.public_subnet_id}"]
  name = "demo_webapp_asg-${var.webapp_lc_name}"
  max_size = "${var.asg_max}"
  min_size = "${var.asg_min}"
  min_elb_capacity = "${var.asg_min}"
  force_delete = true # what's this do?
  launch_configuration = "${var.webapp_lc_id}"
  load_balancers = ["${var.webapp_elb_name}"]
  tag {
    key = "Name"
    value = "terraform_asg"
    propagate_at_launch = "true"
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name = "terraform_asg_scale_up"
  scaling_adjustment = 2
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.webapp_asg.name}"
}

resource "aws_autoscaling_policy" "scale_down" {
  name = "terraform_asg_scale_down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 600
  autoscaling_group_name = "${aws_autoscaling_group.webapp_asg.name}"
}

output "asg_id" {
  value = "${aws_autoscaling_group.webapp_asg.id}"
}
