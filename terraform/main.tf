
# Network module to create VPC, subnets, and routing
module "network" {
  source             = "./modules/networking"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "my-vpc"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  subnet_id     = module.networking.aws_subnet.public_subnet.id  # Public subnet for frontend

}

# Frontend EC2 instance in the public subnet
module "frontend" {
  source        = "./modules/ec2"
  ami_id        = "ami-0866a3c8686eaeeba"  # Update with the Ubuntu 22.04 AMI ID
  instance_type = "t3.micro"
  subnet_id     = module.network.aws_subnet.public_subnet.id  # Public subnet for frontend
  # vpc_id        = module.network.aws_vpc.myvpc.id
  instance_name = "frontend"
}

# Backend EC2 instance in the public subnet
module "backend" {
  source        = "./modules/ec2"
  ami_id        = "ami-0866a3c8686eaeeba"  # Update with the Ubuntu 22.04 AMI ID
  instance_type = "t3.micro"
  subnet_id     =  module.network.aws_subnet.public_subnet.id  # Private subnet for backend
  # vpc_id        = module.network.aws_vpc.myvpc.id
  instance_name = "backend"
}

# RDS instance in the private subnet
module "rds" {
  source            = "./modules/rds"
  db_name           = "mydb"
  db_username       = "admin"
  db_password       = "admin123@"  # Use a secure method for production
  db_subnet_group   = module.network.aws_subnet.private_subnet.id # Private subnet for RDS
  # security_group_id = module.rds.aws_security_group.rds_sg.id # Security group for RDS
}

