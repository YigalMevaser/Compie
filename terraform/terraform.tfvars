aws_region = "us-west-2"
tg_name = "web-tg"
alb_name = "web-alb"
tg_port = "80"
tg_protocol = "HTTP"
alb_isinternal = false
listener_port = "80"
listener_protocol = "HTTP"
cf_is_enabled = true
http_port = "80"
https_port = "443"
qs_is_enabled = false
v_protocol_policy = "redirect-to-https"
ma_ttl = 86400
mi_ttl = 0
d_ttl = 3600
restriction_type = "none"
cloudfront_default_certificate = true

table_name = "web-data"
hash_key   = "id"

ami_id              = "ami-0c55b159cbfafe1f0"
instance_type       = "t2.micro"
asg_desired_capacity = 2
asg_max_size         = 4
asg_min_size         = 2

vpc_cidr            = "10.0.0.0/16"
vpc_name            = "main-vpc"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

vpn_gateway_name     = "Main VPN Gateway"
customer_gateway_asn = 65000
customer_gateway_ip  = "your.on.prem.ip"
customer_gateway_name = "Main Customer Gateway"
vpn_connection_name   = "Main VPN Connection"

comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = 2
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = 120
statistic = "Average"
threshold = 80

