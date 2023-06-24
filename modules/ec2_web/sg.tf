resource "aws_security_group" "default_sg" {
  name        = "default_sg"
  description = "Allow inbound traffic"

  dynamic "ingress" {
    for_each = var.sg_allow_default_port
    content {
      description      = "default_sg from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "default_sg"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.default_sg.id
  network_interface_id = aws_instance.web[0].primary_network_interface_id
}

