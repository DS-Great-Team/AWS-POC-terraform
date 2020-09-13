resource "aws_key_pair" "pockey" {
  key_name   = "${var.stack}-pockey"
  public_key = file(var.ssh_key)
}

resource "aws_db_instance" "database-a" {
  allocated_storage        = 1
  backup_retention_period  = 7
  db_subnet_group_name     = "${aws_subnet.data-subnet-a.id}"
  engine                   = "postgres"
  engine_version           = "9.5.4"
  identifier               = "database-a"
  instance_class           = "db.t3.micro"
  multi_az                 = false
  name                     = "database-a"
  password                 = "admin"
  port                     = 5432
  publicly_accessible      = false
  storage_encrypted        = true
  storage_type             = "gp2"
  username                 = "admin"
  vpc_security_group_ids   = ["${aws_security_group.db.id}"]
}

resource "aws_db_instance" "database-b" {
  allocated_storage        = 1
  backup_retention_period  = 7
  db_subnet_group_name     = "${aws_subnet.data-subnet-b.id}"
  engine                   = "postgres"
  engine_version           = "9.5.4"
  identifier               = "database-b"
  instance_class           = "db.t3.micro"
  multi_az                 = false
  name                     = "database-b"
  password                 = "admin"
  port                     = 5432
  publicly_accessible      = false
  storage_encrypted        = true
  storage_type             = "gp2"
  username                 = "admin"
  vpc_security_group_ids   = ["${aws_security_group.db.id}"]
}