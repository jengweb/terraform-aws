resource "aws_instance" "Terraform-EC2" {
  ami           = "ami-01581ffba3821cdf3" #Ubuntu 20.04
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = aws_subnet.Terraform-Subnet-A.id

  # the security group
  vpc_security_group_ids = [aws_security_group.Terraform-SG.id]

  # the public SSH key
  key_name = aws_key_pair.TerraAWSKey.key_name

  tags = {
    Name = "Terraform-EC2"
  }
}
