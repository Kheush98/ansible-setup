# controle security group
resource "aws_security_group" "controle_sg" {
  name = "controle-sg"

  tags = {
    name = "controle"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_my_ip_to_controle" {
  security_group_id = aws_security_group.controle_sg.id
  cidr_ipv4         = "41.83.245.131/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allo_all_trafic_ipv4_for_controle" {
  security_group_id = aws_security_group.controle_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allo_all_trafic_ipv6_for_controle" {
  security_group_id = aws_security_group.controle_sg.id
  cidr_ipv6         = "::0/0"
  ip_protocol       = "-1"
}

# client security group
resource "aws_security_group" "client_sg" {
  name = "client-sg"

  tags = {
    name = "client"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_my_ip_to_client" {
  security_group_id = aws_security_group.client_sg.id
  cidr_ipv4         = "41.83.245.131/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_controle" {
  security_group_id            = aws_security_group.client_sg.id
  referenced_security_group_id = aws_security_group.controle_sg.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_everywhere" {
  security_group_id = aws_security_group.client_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allo_all_trafic_ipv4_for_client" {
  security_group_id = aws_security_group.client_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allo_all_trafic_ipv6_for_client" {
  security_group_id = aws_security_group.client_sg.id
  cidr_ipv6         = "::0/0"
  ip_protocol       = "-1"
}