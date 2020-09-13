resource aws_security_group "db" {
  name        = "${var.stack}-RDS-SG"
  description = "managed by terrafrom for db PostgreSQL servers"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.stack}-RDS-SG"
  }

  ingress {
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = ["${aws_security_group.wordpress.id}"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource aws_security_group "wordpress" {
  name        = "${var.stack}-wordpress-SG"
  description = "This is for ${var.stack}s wordpress web servers security group"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.stack}-wordpress-SG"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
