module "example_context" {
  source     = "registry.terraform.io/SevenPico/context/null"
  version    = "2.0.0"
  context    = module.context.self
  attributes = ["example", "sfn"]
}

module "async_sfn_error_notifications" {
  source  = "../../"
  context = module.example_context.self

  eventbridge_pipe_name = "example-pipe"
  eventbridge_rule_name = "example-rule"
  sqs_queue_name        = "example-queue"
  rate_sns_topic_arn    = module.example_sns_topic.arn
  volume_sns_topic_arn  = module.example_sns_topic.arn
  state_machine_arn     = module.example_step_function.state_machine_arn
}
