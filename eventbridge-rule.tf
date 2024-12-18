module "eventbridge_rule_context" {
  source  = "SevenPico/context/null"
  version = "2.0.0"
  context = module.sfn_error_notification_context.self

  attributes = [var.sqs_queue_name]
}

resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
  count       = module.sfn_error_notification_context.enabled ? 1 : 0
  name        = var.eventbridge_rule_name
  description = "Eventbridge rule to route failure events to sqs."
  event_pattern = jsonencode({
    "source" : ["aws.states"],
    "detail-type" : ["Step Functions Execution Status Change"],
    "detail" : {
      "status" : ["FAILED"],
      "stateMachineArn" : [var.state_machine_arn]
    }
  })
}

resource "aws_cloudwatch_event_target" "eventbridge_target" {
  count     = module.sfn_error_notification_context.enabled ? 1 : 0
  rule      = try(aws_cloudwatch_event_rule.eventbridge_rule[0].name, "")
  target_id = "send-to-sqs"
  arn       = try(aws_sqs_queue.dead_letter_queue[0].arn, "")
}
