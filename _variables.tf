variable "state_machine_arn" {
  description = "The ARN of the Step Function to monitor."
  type        = string
}

variable "sqs_kms_key_id" {
  description = "(Optional) Managed key for encryption at rest."
  type        = string
  default     = null
}

variable "sqs_queue_name" {
  description = "Name of the SQS Dead Letter Queue."
  type        = string
}

variable "sqs_message_retention_seconds" {
  description = "(Optional) SQS message retention period in seconds."
  type        = number
  default     = 604800
}

variable "sqs_visibility_timeout_seconds" {
  description = "(Optional) SQS visibility timeout in seconds."
  type        = number
  default     = 2
}

variable "eventbridge_rule_name" {
  description = "Name of the EventBridge Rule."
  type        = string
}

variable "alarms_period" {
  description = "(Optional) Period in seconds for CloudWatch alarms."
  type        = number
  default     = 60
}

variable "alarms_datapoints_to_alarm" {
  description = "(Optional) Number of data points that must breach to trigger the alarm."
  type        = number
  default     = 2
}

variable "alarms_evaluation_periods" {
  description = "(Optional) Number of periods over which data is compared to the specified threshold."
  type        = number
  default     = 2
}

variable "eventbridge_pipe_name" {
  description = "The name of the Pipe."
  type        = string
}

variable "eventbridge_pipe_batch_size" {
  description = "(Optional) Batch size for EventBridge Pipe processing."
  type        = number
  default     = 1
}

variable "eventbridge_pipe_log_level" {
  description = "(Optional) Logging level for EventBridge Pipe."
  type        = string
  default     = "ERROR"
}

variable "cloudwatch_log_retention_days" {
  description = "The number of days to retain logs in AWS CloudWatch before they are automatically deleted."
  type        = number
  default     = 90
}

variable "target_step_function_input_template" {
  description = "(Optional) The event transformation template for step function."
  type        = string
  default     = "<$.detail.input>"
}


variable "rate_sns_topic_arn" {
  description = "(Optional) ARN of the SNS topic for rate alarm notifications. Defaults to an empty string."
  type        = string
  default     = ""
}

variable "volume_sns_topic_arn" {
  description = "(Optional) ARN of the SNS topic for volume alarm notifications. Defaults to an empty string."
  type        = string
  default     = ""
}

variable "sns_kms_key_id" {
  description = "(Optional) Managed key for encryption at rest. Defaults to null."
  type        = string
  default     = null
}
