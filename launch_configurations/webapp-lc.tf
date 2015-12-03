resource "aws_launch_configuration" "webapp_lc" {
  name = "demo_webapp_lc"
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
