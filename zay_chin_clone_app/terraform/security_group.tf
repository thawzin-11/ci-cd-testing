resource "aws_security_group" "alb" {
 name = "ZayWalAppAlbSg-02"
 description = "security group for zay wal app lb 02"
 vpc_id = aws_vpc.main.id
  
 ingress {
  protocol         = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }
  
 egress {
  protocol         = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }
}

resource "aws_security_group" "api" {
 name = "ApiServiceSg-02"
 description = "security group for api service 02"
 vpc_id = aws_vpc.main.id

 ingress {
  protocol = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }

 egress {
  protocol         = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }
}

resource "aws_security_group" "db" {
 name = "DbServiceSg-02"
 description = "security group for db service 02"
 vpc_id = aws_vpc.main.id

 ingress {
  protocol = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }

 egress {
  protocol         = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }
}

resource "aws_security_group" "admin" {
 name = "AdminServiceSg-02"
 description = "security group for admin service 02"
 vpc_id = aws_vpc.main.id

 ingress {
  protocol = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }

 egress {
  protocol         = "-1"
  from_port        = 0
  to_port          = 0
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
 }
}