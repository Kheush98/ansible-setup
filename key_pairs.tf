resource "aws_key_pair" "controle_key_pair" {
  key_name   = "controle"
  public_key = var.controle_public_key
}

resource "aws_key_pair" "client_key_pair" {
  key_name   = "client"
  public_key = var.client_public_key
}