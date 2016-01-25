resource "aws_launch_configuration" "webapp_lc" {
  lifecycle { create_before_destroy = true }
  image_id = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  security_groups = [
    "${var.webapp_http_inbound_sg_id}",
    "${var.webapp_ssh_inbound_sg_id}",
    "${var.webapp_outbound_sg_id}"
  ]
  user_data = "${file("./launch_configurations/userdata.sh")}"
  key_name = "${var.key_name}"
  associate_public_ip_address = true
}
output "webapp_lc_id" {
  value = "${aws_launch_configuration.webapp_lc.id}"
}
output "webapp_lc_name" {
  value = "${aws_launch_configuration.webapp_lc.name}"
}
