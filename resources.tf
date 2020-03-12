provider "huaweicloud" {
  user_name   = "hwstaff_pub_ecssl"
  password    = "4q.9p54q"
  auth_url    = "http://121.37.227.30:8843/"
  insecure    = true
}

resource "huaweicloud_networking_floatingip_v2" "bosh" {
  pool = "eip_external_net"
}

# key pairs
resource "huaweicloud_compute_keypair_v2" "validator" {
  name       = "validator"
  public_key = "${replace("${file("validator.pub")}","\n","")}"
}

# security group
resource "huaweicloud_networking_secgroup_v2" "secgroup" {
  name = "bosh"
  description = "BOSH Security Group"
}

resource "huaweicloud_networking_secgroup_rule_v2" "secgroup_rule_4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${huaweicloud_networking_secgroup_v2.secgroup.id}"
}

resource "huaweicloud_networking_secgroup_rule_v2" "secgroup_rule_6" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 6868
  port_range_max = 6868
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${huaweicloud_networking_secgroup_v2.secgroup.id}"
}

resource "huaweicloud_networking_secgroup_rule_v2" "secgroup_rule_7" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 0
  port_range_max = 0
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${huaweicloud_networking_secgroup_v2.secgroup.id}"
}

resource "huaweicloud_networking_secgroup_rule_v2" "secgroup_rule_5" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 25555
  port_range_max = 25555
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${huaweicloud_networking_secgroup_v2.secgroup.id}"
}

resource "huaweicloud_networking_secgroup_rule_v2" "secgroup" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  remote_group_id = "${huaweicloud_networking_secgroup_v2.secgroup.id}"
  security_group_id = "${huaweicloud_networking_secgroup_v2.secgroup.id}"
}


# network id
resource "huaweicloud_networking_network_v2" "bosh" {
  name           = "bosh"
  admin_state_up = "true"
}

resource "huaweicloud_networking_subnet_v2" "bosh_subnet" {
  name       = "bosh"
  network_id = "${huaweicloud_networking_network_v2.bosh.id}"
  cidr       = "192.168.1.0/24"
  ip_version = 4
}


