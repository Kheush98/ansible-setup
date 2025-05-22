resource "aws_instance" "controle" {
  ami               = var.AMI_ID["ubuntu"]
  instance_type     = var.INSTANCE_TYPE
  availability_zone = var.ZONE
  security_groups   = [aws_security_group.controle_sg.name]
  key_name          = aws_key_pair.controle_key_pair.key_name

  tags = {
    name = "controle"
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file("keys/controle")
  }

  provisioner "file" {
    destination = "/tmp/ansible.sh"
    source = "ansible.sh"
  }

  provisioner "remote-exec" {
    inline = [ "chmod +x /tmp/ansible.sh", "/tmp/ansible.sh" ]
  }

}

resource "aws_instance" "web_01" {
  ami               = var.AMI_ID["centos"]
  instance_type     = var.INSTANCE_TYPE
  availability_zone = var.ZONE
  security_groups   = [aws_security_group.client_sg.name]
  key_name          = aws_key_pair.client_key_pair.key_name

  tags = {
    name = "client"
  }
}

resource "aws_instance" "web_02" {
  ami               = var.AMI_ID["centos"]
  instance_type     = var.INSTANCE_TYPE
  availability_zone = var.ZONE
  security_groups   = [aws_security_group.client_sg.name]
  key_name          = aws_key_pair.client_key_pair.key_name

  tags = {
    name = "client"
  }
}

resource "aws_instance" "web_03" {
  ami               = var.AMI_ID["centos"]
  instance_type     = var.INSTANCE_TYPE
  availability_zone = var.ZONE
  security_groups   = [aws_security_group.client_sg.name]
  key_name          = aws_key_pair.client_key_pair.key_name

  tags = {
    name = "client"
  }
}