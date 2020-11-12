variable "UbuntuServer20" {
type = string
description = "AMI ID"
default = "ami-06fd8a495a537da8b"

}

data "template_file" "Spot_Userdata" {
  template = file("userdata.sh")
}

variable "SpotPrice" {
  type = string
  default = "0.01"
}

