resource "aws_cloudfront_distribution" "website_distribution" {
  origin {
    domain_name = "insightforge-api.site.site.s3.ap-northeast-2.amazonaws.com"
    origin_id   = "S3-insightforge-api.site"

    
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for my-test-html-survey S3 bucket"
  default_root_object = "create-survey.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-insightforge-api.site"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  aliases = ["www.insightforge-api.site"]
  viewer_certificate {
    acm_certificate_arn            = var.cloudfront_certificate
    ssl_support_method              = "sni-only"
    minimum_protocol_version        = "TLSv1.2_2021"
  }
}
