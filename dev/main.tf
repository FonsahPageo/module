module "my_vpc" {
  source = "../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  tenancy = "default"
  vpc_tag = "ash-vpc"
  vpc_id = "${module.my_vpc.vpc_id}"
  subnet_cidr = "10.0.0.0/24"
  subnet_tag = "ash-sub"
}

module "my_ec2" {
  source = "../modules/ec2"
  ec2_count = "1"
  ami_id = "ami-0a9855834eda160d6"
  instance_type = "t2.micro"
  subnet_id = "${module.my_vpc.subnet_id}"
  instance_tag = "ash-instance"
}