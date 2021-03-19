resource "aws_key_pair" "TerraAWSKey" {
  key_name   = "TerraAWSKey"
  public_key = var.AWS_PUBLIC_KEY
}
