resource "aws_lb_target_group" "tmmc_tok_tg80" {
  name     = "tmmc-tok-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_tok_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-tokTargetGroup"
    Service = "tmmc_tok"
    Owner   = "Balactus"
    Project = "App1"
  }
}


resource "aws_lb_target_group" "tmmc_tok_tg443" {
  name     = "tmmc-tok-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_tok_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-tokTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "App2"
  }
}
