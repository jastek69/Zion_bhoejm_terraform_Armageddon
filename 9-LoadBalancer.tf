resource "aws_lb" "tmmc_tok_lb01" {
  name               = "tmmc-tok-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tmmc_tok_LB01-SG01-443.id]
  subnets            = [
    aws_subnet.public-ap-northeast-1a.id,    
    aws_subnet.public-ap-northeast-1c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "tmmc_tok_LoadBalancer"
    Service = "tmmc_tok"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.tmmc_tok_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_tok_tg80.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.tmmc_tok_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_tok_tg443.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.tmmc_tok_lb01.dns_name
  description = "The DNS name of the tmmc_tok Load Balancer."
}
