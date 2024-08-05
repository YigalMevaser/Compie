resource "aws_cloudfront_distribution" "web" {
  enabled             = var.cf_is_enabled #true
  default_root_object = "index.html"

  origin {
    domain_name = var.alb_domain_name
    origin_id   = var.alb_domain_name

    custom_origin_config {
      http_port              = var.http_port #80
      https_port             = var.https_port #443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.alb_domain_name

    forwarded_values {
      query_string = var.qs_is_enabled #false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = var.v_protocol_policy #"redirect-to-https"
    min_ttl                = var.mi_ttl #0
    default_ttl            = var.d_ttl #3600
    max_ttl                = var.ma_ttl #86400
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type #"none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate #true
  }
}