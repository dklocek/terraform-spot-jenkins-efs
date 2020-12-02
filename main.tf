provider "aws" {
  region = "eu-west-1"
}

resource "aws_spot_fleet_request" "SpotRequest" {
  iam_fleet_role = "arn:aws:iam::329794110703:role/aws-ec2-spot-fleet-tagging-role"
  target_capacity = 1
  spot_price = var.SpotPrice
  terminate_instances_with_expiration = true
  wait_for_fulfillment = true

  launch_specification {
    ami = var.UbuntuServer20
    instance_type = var.InstanceType
    user_data = data.template_file.Spot_Userdata.rendered

  }

  launch_specification {
    ami = var.UbuntuServer20
    instance_type = "t3.small"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = var.UbuntuServer20
    instance_type = "t3a.medium"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = var.UbuntuServer20
    instance_type = "t3.medium"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = var.UbuntuServer20
    instance_type = "t2.medium"
    user_data = data.template_file.Spot_Userdata.rendered
  }

}
