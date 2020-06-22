provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "10205monTH"
  auth_url    = "http://192.168.1.80:5000/v3"
  region      = "RegionOne"
}

resource "openstack_compute_instance_v2" "Backend" {
  name            = "Backend"
  image_name      = "Ubuntu-18.04-x86_64"
  flavor_name     = "m1.small-2"
  availability_zone = "nova"
  key_pair        = "user"
  security_groups = ["default"]

  network {
    access_network = "true"
    name = "external_network"
  }
}
