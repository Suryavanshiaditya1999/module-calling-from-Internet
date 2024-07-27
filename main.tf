
provider "aws" {
  region = "us-east-1"
}

module "network_interface" {
  source = "github.com/Suryavanshiaditya1999/kibana-module-haru//modules/network_interface?ref=main"
  network_interface_subnet_id = "subnet-0db70e2055a3e0f86"
  network_interface_security_groups = ["sg-0d63fb1b1de6bd708"]
  network_interface_tags_Name = "network-interface"
}

module "ec2" {
  source = "github.com/Suryavanshiaditya1999/kibana-module-haru//modules/ec2_instance?ref=main"
  
  deploy_ec2_private1_instance_ami          = "ami-04a81a99f5ec58529"
  deploy_ec2_private1_instance_instance_type = "t2.micro"
  deploy_ec2_private1_instance_device_index  = 0
  deploy_ec2_private1_instance_network_interface_id = module.network_interface.network_interface_id

  deploy_ec2_private1_instance_key_name     = "DevInfraAditya"
  deploy_ec2_private1_instance_tags_name    = "module"
}

