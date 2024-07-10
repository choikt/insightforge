provider "aws" {
  region = var.region
}

resource "aws_launch_template" "nginx_pub_2a" {
  name_prefix   = "VEC-PRD-VPC-NGINX-PUB-2A"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  network_interfaces {
    subnet_id         = var.nginx_pub_2a_subnet
    security_groups   = [var.nginx_security_group]
    associate_public_ip_address = true
  }
}

resource "aws_launch_template" "nginx_pub_2c" {
  name_prefix   = "VEC-PRD-VPC-NGINX-PUB-2C"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  network_interfaces {
    subnet_id         = var.nginx_pub_2c_subnet
    security_groups   = [var.nginx_security_group]
    associate_public_ip_address = true
  }
}

resource "aws_launch_template" "tomcat_pri_2a" {
  name_prefix   = "VEC-PRD-VPC-TOMCAT-PRI-2A"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  network_interfaces {
    subnet_id         = var.tomcat_pri_2a_subnet
    security_groups   = [var.tomcat_security_group]
    associate_public_ip_address = false
  }
}

resource "aws_launch_template" "tomcat_pri_2c" {
  name_prefix   = "VEC-PRD-VPC-TOMCAT-PRI-2C"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  network_interfaces {
    subnet_id         = var.tomcat_pri_2c_subnet
    security_groups   = [var.tomcat_security_group]
    associate_public_ip_address = false
  }
}

resource "aws_launch_template" "db_pri_2a" {
  name_prefix   = "VEC-PRD-VPC-DB-PRI-2A"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  network_interfaces {
    subnet_id         = var.db_pri_2a_subnet
    security_groups   = [var.db_security_group]
    associate_public_ip_address = true
  }
}

resource "aws_launch_template" "db_pri_2c" {
  name_prefix   = "VEC-PRD-VPC-DB-PRI-2C"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  network_interfaces {
    subnet_id         = var.db_pri_2c_subnet
    security_groups   = [var.db_security_group]
    associate_public_ip_address = true
  }
}
