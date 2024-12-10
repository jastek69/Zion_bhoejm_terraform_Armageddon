
data "aws_route53_zone" "main" {
  name         = "jastek.click"  # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "jastek.click"
  type    = "A"

  alias {
    name                   = aws_lb.tmmc_tok_lb01.dns_name
    zone_id                = aws_lb.tmmc_tok_lb01.zone_id
    evaluate_target_health = true
  }
}
