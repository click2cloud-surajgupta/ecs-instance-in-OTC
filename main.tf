provider "opentelekomcloud" {
  access_key  = "xxxxxxxxxxx"
  secret_key  = "xxxxxxxxxxx"
  domain_name = "xxxxxxxxxxx"
  tenant_name = "xxxxxxxxxxx"
  auth_url    = "xxxxxxxxxxx"
}

resource "opentelekomcloud_ecs_instance_v1" "ecs" {
  name     = "suraj_ecs" 
  image_id = "b627a72e-c550-4cee-b145"
  flavor   = "s2.medium.1"  
  vpc_id   = "${opentelekomcloud_vpc_v1.vpc_2.id}"

  nics {
    network_id = "${opentelekomcloud_networking_network_v2.network.id}"
  }

  availability_zone = "eu-de-01"
}


resource "opentelekomcloud_vpc_v1" "vpc_2" {
  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"
}

resource "opentelekomcloud_networking_network_v2" "network" {
  name = "suraj_Network"
}

resource "opentelekomcloud_networking_subnet_v2" "subnet" {
  name            = "suraj_subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.network.id}"
  cidr            = "${var.vpc_cidr}"
}

