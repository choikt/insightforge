variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-2"
}

variable "s3_bucket_name" {
  description = "The name of the existing S3 bucket"
  type        = string
  default     = "my-sesafasdf"
}

variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
  default = "survey"
}

variable "api_gateway_description" {
  description = "The description of the API Gateway"
  type        = string
  default = ""
}

variable "api_gateway_stage_name" {
  description = "The stage name for the API deployment"
  type        = string
  default     = "test"
}

variable "surveys_table_name" {
  description = "The name of the Surveys DynamoDB table"
  type        = string
  default     = "Surveys"
}

variable "survey_responses_table_name" {
  description = "The name of the SurveyResponses DynamoDB table"
  type        = string
  default     = "SurveyResponses"
}


variable "certificate_arn_api" {
  type        = string
  default = "arn:aws:acm:ap-northeast-2:339713013785:certificate/b800ce41-95e2-4113-ad7a-6dfe8a4f5040"
}

variable "custom_domain_name" {
  type        = string
  default = "api.insightforge-api.site"

}
variable "cloudfront_zone_id" {
  type        = string
  default = "Z00569421KQTQAF45T9VA"

}

variable "cloudfront_certificate" {
  type        = string
  default = "arn:aws:acm:us-east-1:339713013785:certificate/f150d65e-0b31-4610-b4e5-cbd1415d13e9"

}