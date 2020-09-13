resource "aws_key_pair" "pockey" {
  key_name   = "${var.stack}-pockey"
  public_key = file(var.ssh_key)
}

resource "aws_db_instance" "database" {
  allocated_storage        = 10
  backup_retention_period  = 7
  db_subnet_group_name     = aws_db_subnet_group.subnet-group.id
  engine                   = "postgres"
  engine_version           = "9.6.9"
  identifier               = "database"
  instance_class           = "db.t3.micro"
  multi_az                 = true
  name                     = "databasepg"
  password                 = "nicole123"
  port                     = 5432
  publicly_accessible      = false
  storage_encrypted        = true
  storage_type             = "gp2"
  username                 = "nicole"
  vpc_security_group_ids   = ["${aws_security_group.db.id}"]
}