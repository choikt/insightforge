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
  default = "arn:aws:acm:ap-northeast-2:339713013785:certificate/203fe3a6-f0bf-4625-b29f-9e45476a268c"

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
  default = "arn:aws:acm:us-east-1:339713013785:certificate/8d91c442-424f-4289-b7fc-2bd16034a560"

}