
resource "aws_db_instance" "mysql" {
  identifier             = "mysql-db"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0.39"  # Use a version compatible with db.t3.micro
  instance_class         = "db.t3.micro"  # Changed to db.t3.micro (compatible with MySQL 8.0)
  db_name                = var.db_name
  username               = var.db_username
  password               = "admin123"
  skip_final_snapshot    = true
  publicly_accessible    = false
  # vpc_security_group_ids = [aws_security_group.db_sg.id]
    tags = {
    Name = var.db_name
  }
}
# # DB Subnet Group
# resource "aws_db_subnet_group" "my_db_subnet_group" {
#   name       = "my-db-subnet-group"
#   subnet_ids = [aws_subnet.private_subnet.id]
# }


