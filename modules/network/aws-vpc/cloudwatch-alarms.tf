resource "aws_cloudwatch_metric_alarm" "vpc_change_alarm" {
  alarm_name          = "${var.environment}-vpc-attempted-change-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "VpcEventCount"
  namespace           = "AWS/CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Triggered by any calls to modify VPC(s)"
}
