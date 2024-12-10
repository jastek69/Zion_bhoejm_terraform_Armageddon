#Target Group for Port 80 app
resource "aws_security_group" "tmmc_tok_TG01-SG01-80" {
  name        = "tmmc_tok_TG01-SG01-80"
  description = "tmmc_tok_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_tok_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_tok_TG01-SG01-80"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }

}



# LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_tok_LB01-SG01-443" {
  name        = "tmmc_tok_LB01-SG01-443"
  description = "tmmc_tok_LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_tok_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_tok_LB01-SG01-443"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }

}


# Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_tok_SL01-SG01-443" {
  name        = "tmmc_tok_SL01-SG01-443"
  description = "tmmc_tok_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_tok_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_tok_SL01-SG01-443"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }

}
