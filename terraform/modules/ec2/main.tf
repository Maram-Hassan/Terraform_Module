resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      ="new-key"


  tags = {
    Name = var.instance_name
  }
    provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y curl",
      " curl -fsSL https://get.docker.com -o get-docker.sh",
      "sh get-docker.sh"
    ]

  }
}
