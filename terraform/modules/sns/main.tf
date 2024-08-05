resource "aws_sns_topic" "admin_alerts" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "admin_sms" {
  topic_arn = aws_sns_topic.admin_alerts.arn
  protocol  = "sms"
  endpoint  = var.admin_phone_number
}

resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [var.asg_name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.admin_alerts.arn
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_up" {
  alarm_name          = "cpu-alarm-up"
  comparison_operator = var.comparison_operator #"GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods #"2"
  metric_name         = var.metric_name #"CPUUtilization"
  namespace           = var.namespace #"AWS/EC2"
  period              = var.period #"120"
  statistic           = var.statistic #"Average"
  threshold           = var.threshold #"80"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_sns_topic.admin_alerts.arn]

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }
}