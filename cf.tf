module "cdn" {
  source = "terraform-aws-modules/cloudfront/aws"

  enabled             = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false

  origin = {
    ghost = {
      domain_name = aws_lb.ghost_lb.dns_name
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      }
    }
  }

  default_cache_behavior = {
    target_origin_id           = "ghost"
    viewer_protocol_policy     = "allow-all"

    allowed_methods = ["GET", "HEAD", "PUT", "POST", "PATCH", "DELETE", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

}
