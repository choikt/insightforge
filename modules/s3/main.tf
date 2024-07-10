resource "aws_s3_bucket" "waf_logs_nginx" {
  bucket = "aws-waf-logs-nginx-1"
}

resource "aws_s3_bucket" "waf_logs_tomcat" {
  bucket = "aws-waf-logs-tomcat-1"
}
