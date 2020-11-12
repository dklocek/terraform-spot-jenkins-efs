variable "ami" {
type = string
description = "AMI ID"
default = "ami-08a2aed6e0a6f9c7d"
}

data "template_file" "Spot_Userdata" {
  template = file("userdata.sh")
}

variable "SpotPrice" {
  type = string
  default = "0.015"
}
