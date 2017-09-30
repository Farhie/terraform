resource "aws_cloudwatch_metric_alarm" "network_acl_change_alarm" {
  count               = "${var.monitoring}"
  alarm_name          = "${var.environment}-network-acl-attempted-change-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "NetworkAclEventCount"
  namespace           = "AWS/CloudTrailMetrics"
  period              = "300"
  statistic           = "sum"
  threshold           = "1"
  alarm_description   = "Triggered by any calls to modify network ACL"
}
