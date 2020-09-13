resource "aws_route53_zone" "poc_zone" {
  name = "poc.com"
}

resource "aws_route53_record" "poc-policy" {
  name           = "sample.poc.com"
  type           = "CNAME"
  zone_id        = aws_route53_zone.poc_zone.zone_id
  ttl            = "300"
  latency_routing_policy {
    region = "us-east-1"
  }
  set_identifier = "random-ip"
  records        = ["8.8.8.8"]
  health_check_id = "aaaaaaaa-aaaa-aaaa-aaaa-64c5b689041a"
}