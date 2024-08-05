provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./terraform/modules/networking"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "ec2" {
  source = "./terraform/modules/ec2"
  vpc_id = module.networking.vpc_id
  subnet_ids = module.networking.public_subnet_ids
  ami_id = var.ami_id
  instance_type = var.instance_type
  security_group_id = module.ec2.security_group_id
  asg_desired_capacity = var.asg_desired_capacity
  asg_max_size = var.asg_max_size
  asg_min_size = var.asg_min_size
}

module "vpn" {
  source = "./terraform/modules/vpn"
  vpc_id = module.networking.vpc_id
  customer_gateway_ip = var.customer_gateway_ip
  customer_gateway_asn = var.customer_gateway_asn
  customer_gateway_name = var.customer_gateway_name
  vpn_connection_name = var.vpn_connection_name
  vpn_gateway_name = var.vpn_gateway_name
}

module "db" {
  source = "./terraform/modules/db"
  table_name = var.table_name
  hash_key   = var.hash_key
}

module "alb" {
  source = "./terraform/modules/alb"
  vpc_id = module.networking.vpc_id
  subnet_ids = module.networking.public_subnet_ids
  ec2_security_group_id = module.ec2.security_group_id
  alb_name          = var.alb_name
  target_group_name = var.tg_name
  tg_port           = var.tg_port
  tg_protocol       = var.tg_protocol
  alb_isinternal    = var.alb_isinternal
  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol
}

module "cloudfront" {
  source = "./terraform/modules/cloudfront"
  alb_domain_name = module.alb.alb_dns_name
  cf_is_enabled = var.cf_is_enabled
  http_port = var.http_port
  https_port = var.https_port
  qs_is_enabled = var.qs_is_enabled
  v_protocol_policy = var.v_protocol_policy
  mi_ttl = var.mi_ttl
  ma_ttl = var.ma_ttl
  d_ttl = var.d_ttl
  restriction_type = var.restriction_type
  cloudfront_default_certificate = var.cloudfront_default_certificate
}

module "sns" {
  source             = "./terraform/modules/sns"
  topic_name         = "admin-alerts"
  admin_phone_number = "+1234567890"  # Replace with actual phone number
  asg_name           = module.ec2.asg_name
  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods
  metric_name = var.metric_name
  namespace = var.namespace
  period = var.period
  statistic = var.statistic
  threshold = var.threshold
}

module "secrets" {
  source              = "./terraform/modules/secrets"
  secret_name         = "web-secret"
  secret_value        = {
    username = "admin"
    password = "password123"  # Replace with actual secret
  }
  external_account_id = "123456789012"  # Replace with actual account ID
}

module "codedeploy" {
  source                = "./terraform/codedeploy"
  app_name              = "web-app"
  deployment_group_name = "web-deployment-group"
  ec2_tag_value         = "web-server"
}