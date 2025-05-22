output "controle_public_ip" {
  value = aws_instance.controle.public_ip
}

output "web_01_public_ip" {
  value = aws_instance.web_01.public_ip
}

output "web_02_public_ip" {
  value = aws_instance.web_02.public_ip
}

output "web_03_public_ip" {
  value = aws_instance.web_03.public_ip
}