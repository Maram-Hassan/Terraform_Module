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

   connection {
      type        = "ssh"
      user        = "ubuntu"  # The default user for Ubuntu AMIs; change if you're using a different AMI
      private_key = "new-key"  # Path to the private key file
      host        = self.public_ip  # Use the public IP of the instance to SSH into it
    }
}
