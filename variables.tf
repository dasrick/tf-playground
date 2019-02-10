// application ---------------------------------------------------------------------------------------------------------
variable "application" {
  description = "Name of application (always lowercase)"
  type        = "string"
  default     = "playground"
}

variable "environment" {
  description = "Name of the environment (in our case a combi of Account+Environment)"
  type        = "string"
}

// AWS -----------------------------------------------------------------------------------------------------------------
variable "region" {
  description = "AWS - Region"
  type        = "string"
  default     = "eu-west-1"
}

variable "s3-artifacts" {
  description = "S3 bucket to store artifacts (e.g. lambda packages)"
  type        = "string"
}

// Tags ----------------------------------------------------------------------------------------------------------------
variable "tag_environment" {
  description = "TAG - Environment (DEV / STAGING / PROD)"
  type        = "string"
}

variable "tag_pname" {
  description = "TAG - Product name"
  type        = "string"
  default     = "PLAYGROUND"
}

// locals --------------------------------------------------------------------------------------------------------------
locals {
  name_prefix              = "${var.application}-${var.environment}"
  s3_key_golang_playground = "${var.golang_playground_path}${var.golang_playground_version}/"

  common_tags = {
    Environment = "${var.tag_environment}"
    ProductName = "${var.tag_pname}"
  }
}

// lambda pathes and versions ------------------------------------------------------------------------------------------
variable "golang_playground_path" {
  description = "Path of lambdas of playground based on golang"
  type        = "string"
  default     = "playground/golang-playground/"
}

variable "golang_playground_version" {
  description = "Version of lambdas of playground based on golang"
  type        = "string"
  default     = "master"
}
