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
