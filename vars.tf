variable "REGION" {
  default = "us-east-1"
}

variable "ZONE" {
  default = "us-east-1a"
}

variable "AMI_ID" {
  type = map(any)
  default = {
    ubuntu = "ami-084568db4383264d4"
    centos = "ami-066b4eecd8ba4c4f4"
  }
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "controle_public_key" {
  type = string
}

variable "client_public_key" {
  type = string
}