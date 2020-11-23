<h1>terraform-spot-jenkins-efs</h1>

Simple terraform with userdata that creates a Spot Fleet request with a template.

Running on Ubuntu 20, attached AWS EFS drive, which contains JENKINS_HOME folder with users and ready to go jobs.

Vars set as:

InstanceType = t3.small (can be set as a fleet of instances)
SpotPrice = 0.01 (in $, maximum spot instance price)

in main.tf

ami = "ami-06fd8a495a537da8b" (Ubuntu 20.04)