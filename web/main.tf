#ec2

resource "aws_instance" "server" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"
  subnet_id = var.sn
  security_groups = [var.sg]

  tags = {
    Name = "myserver"
  }
}