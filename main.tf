# EC2 Instanz erstellen
resource "aws_instance" "web" {
  ami           = "ami-0a02ee601d742e89f"
  instance_type = var.server_type
  count         = var.server_count
  user_data     = file("./user_data.sh")

  tags = {
    Name = "Instanz ${count.index}"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "sldemo-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}