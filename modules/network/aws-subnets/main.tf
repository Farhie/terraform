resource "aws_subnet" "subnet" {
  count             = "${length(var.availability_zones)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block        = "${var.cidr_block_map[element(var.availability_zones, count.index)]}"
  vpc_id            = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-${var.subnet_type}-subnet-${element(var.availability_zones, count.index)}"
    Type        = "VPC Subnet"
    Region      = "${var.region}"
    Environment = "${var.environment}"
  }
}
