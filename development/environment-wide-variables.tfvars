environment = "development"

region = "us-west-2"

availability_zones = ["us-west-2a", "us-west-2b"]

vpc_cidr = "172.27.214.0/23"

public_subet_cidrs = {us-west-2a = "172.27.214.0/25", us-west-2b = "172.27.215.0/25"}

private_subet_cidrs = {us-west-2a = "172.27.214.128/25", us-west-2b = "172.27.215.128/25"}

terraform_state_bucket = "nordstrom-oms-development-state-storage"