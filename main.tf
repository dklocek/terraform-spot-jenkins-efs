provider "aws" {
  region = "eu-west-1"
}


resource "aws_spot_instance_request" "SpotInstanceRequest" {
  ami = "ami-06fd8a495a537da8b"
  key_name = "MainKeys"
  instance_type = "t3.medium"
  user_data = data.template_file.Spot_Userdata.rendered
  spot_price = var.SpotPrice
  tags = {name="SpotInstance"}
}
