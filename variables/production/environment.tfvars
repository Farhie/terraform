environment = "production"

region = "us-west-2"

availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

vpc_cidr = "172.27.216.0/23"

public_subnet_cidrs = {"us-west-2a" = "172.27.216.0/27", "us-west-2b" = "172.27.216.32/27", "us-west-2c" = "172.27.216.64/27"}

private_subnet_cidrs = {"us-west-2a" = "172.27.216.128/25", "us-west-2b" = "172.27.217.0/25", "us-west-2c" = "172.27.217.128/25"}