resource "aws_security_group" "Terraform-SG" {
  vpc_id      = aws_vpc.Terraform-VPC.id
  name        = "Terraform-SG"
  description = "security group that allows ssh traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Terraform-SG"
  }
}
