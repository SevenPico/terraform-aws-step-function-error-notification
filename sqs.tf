module "sqs_context" {
  source  = "SevenPico/context/null"
  version = "2.0.0"
  context = module.context.self

  attributes = [var.sqs_queue_name]
}

resource "aws_sqs_queue" "dead_letter_queue" {
  count                      = module.sfn_error_notification_context.enabled ? 1 : 0
  name                       = module.sqs_context.id
  message_retention_seconds  = var.sqs_message_retention_seconds
  visibility_timeout_seconds = var.sqs_visibility_timeout_seconds

  kms_master_key_id = var.sqs_kms_key_id
  tags              = module.sfn_error_notification_context.tags
}
