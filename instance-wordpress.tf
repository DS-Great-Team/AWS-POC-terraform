resource "aws_instance" "wordpress-a" {
  ami                         = "ami-0c94855ba95c71c99"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.pockey.key_name
  vpc_security_group_ids      = [aws_security_group.wordpress.id]
  subnet_id                   = aws_subnet.app-subnet-a.id
  associate_public_ip_address = true
  tags = {
    Name = "EC2 Instance"
  }
}

resource "aws_instance" "wordpress-b" {
  ami                         = "ami-0c94855ba95c71c99"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.pockey.key_name
  vpc_security_group_ids      = [aws_security_group.wordpress.id]
  subnet_id                   = aws_subnet.app-subnet-b.id
  associate_public_ip_address = true
  tags = {
    Name = "EC2 Instance"
  }
}