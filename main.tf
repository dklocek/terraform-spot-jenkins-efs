provider "aws" {
  region = "eu-west-1"
}

resource "aws_spot_fleet_request" "SpotRequest" {
  iam_fleet_role = "arn:aws:iam::329794110703:role/aws-ec2-spot-fleet-tagging-role"
  target_capacity = 1
  spot_price = var.SpotPrice
  terminate_instances_with_expiration = true

  launch_specification {
    ami = "ami-06fd8a495a537da8b"
    instance_type = "t3a.small"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = "ami-06fd8a495a537da8b"
    instance_type = "t3.small"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = "ami-06fd8a495a537da8b"
    instance_type = "t3a.medium"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = "ami-06fd8a495a537da8b"
    instance_type = "t3.medium"
    user_data = data.template_file.Spot_Userdata.rendered
  }

  launch_specification {
    ami = "ami-06fd8a495a537da8b"
    instance_type = "t2.medium"
    user_data = data.template_file.Spot_Userdata.rendered
  }

}
