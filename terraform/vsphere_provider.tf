provider "vsphere" {
  version              = "~> 1.16"
  alias                = "mdc1"
  vsphere_server       = "vc1.ops.mdc1.mozilla.com"
  allow_unverified_ssl = true
}

provider "vsphere" {
  version              = "~> 1.16"
  alias                = "mdc2"
  vsphere_server       = "vc1.ops.mdc2.mozilla.com"
  allow_unverified_ssl = true
}

# ============================================================

# MDC1 Datacenter
data "vsphere_datacenter" "mdc1" {
  provider = vsphere.mdc1
  name     = "MDC1"
}
output "mdc1_vsphere_id" {
  value = data.vsphere_datacenter.mdc1.id
}

# MDC1 Releng RDS datastore cluster
data "vsphere_datastore_cluster" "mdc1_releng_datastore_cluster" {
  provider      = vsphere.mdc1
  name          = "esx_ssd_releng"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_datastore_cluster" {
  value = data.vsphere_datastore_cluster.mdc1_releng_datastore_cluster.id
}

# MDC1 Relops-Terraform resource pool
data "vsphere_resource_pool" "mdc1_relops_terraform_resource_pool" {
  provider      = vsphere.mdc1
  name          = "Relops-Terraform"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_relops_terraform_resource_pool" {
  value = data.vsphere_resource_pool.mdc1_relops_terraform_resource_pool.id
}

# private.releng.mdc1 vlan275
data "vsphere_network" "mdc1_releng_network_vlan_275" {
  provider      = vsphere.mdc1
  name          = "RelEng Private VLAN275"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_275" {
  value = data.vsphere_network.mdc1_releng_network_vlan_275.id
}

# public.releng.mdc1 vlan3001
data "vsphere_network" "mdc1_releng_network_vlan_3001" {
  provider      = vsphere.mdc1
  name          = "RelEng Public VLAN3001"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_3001" {
  value = data.vsphere_network.mdc1_releng_network_vlan_3001.id
}

# relabs.releng.mdc1 vlan278
data "vsphere_network" "mdc1_releng_network_vlan_278" {
  provider      = vsphere.mdc1
  name          = "RelEng RELabs VLAN278"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_278" {
  value = data.vsphere_network.mdc1_releng_network_vlan_278.id
}

# srv.releng.mdc1 vlan248
data "vsphere_network" "mdc1_releng_network_vlan_248" {
  provider      = vsphere.mdc1
  name          = "RelEng Srv VLAN248"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_248" {
  value = data.vsphere_network.mdc1_releng_network_vlan_248.id
}

# test.releng.mcd1 vlan256
data "vsphere_network" "mdc1_releng_network_vlan_256" {
  provider      = vsphere.mdc1
  name          = "RelEng Test VLAN256"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_256" {
  value = data.vsphere_network.mdc1_releng_network_vlan_256.id
}

# tier3.releng.mdc1 vlan260
data "vsphere_network" "mdc1_releng_network_vlan_260" {
  provider      = vsphere.mdc1
  name          = "RelEng Tier3 VLAN260"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_260" {
  value = data.vsphere_network.mdc1_releng_network_vlan_260.id
}

# wintest.releng.mdc1 vlan240
data "vsphere_network" "mdc1_releng_network_vlan_240" {
  provider      = vsphere.mdc1
  name          = "RelEng WinTest VLAN240"
  datacenter_id = "${data.vsphere_datacenter.mdc1.id}"
}
output "mdc1_releng_network_vlan_240" {
  value = data.vsphere_network.mdc1_releng_network_vlan_240.id
}

# ============================================================

# MDC2 Datacenter
data "vsphere_datacenter" "mdc2" {
  provider = vsphere.mdc2
  name     = "MDC2"
}
output "mdc2_vsphere_id" {
  value = data.vsphere_datacenter.mdc2.id
}

data "vsphere_datastore_cluster" "mdc2_releng_datastore_cluster" {
  provider      = vsphere.mdc2
  name          = "esx_ssd_releng"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_datastore_cluster" {
  value = data.vsphere_datastore_cluster.mdc2_releng_datastore_cluster.id
}

data "vsphere_resource_pool" "mdc2_relops_terraform_resource_pool" {
  provider      = vsphere.mdc2
  name          = "Relops-Terraform"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_resource_pool" {
  value = data.vsphere_resource_pool.mdc2_relops_terraform_resource_pool.id
}

# private.releng.mdc2 vlan275
data "vsphere_network" "mdc2_releng_network_vlan_275" {
  provider      = vsphere.mdc2
  name          = "RelEng-Private VLAN275"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_275" {
  value = data.vsphere_network.mdc2_releng_network_vlan_275.id
}

# pu8blic.releng.mdc2 vlan3001
data "vsphere_network" "mdc2_releng_network_vlan_3001" {
  provider      = vsphere.mdc2
  name          = "RelEng-Public VLAN3001"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_3001" {
  value = data.vsphere_network.mdc2_releng_network_vlan_3001.id
}

# relabs.releng.mdc2 vlan278
data "vsphere_network" "mdc2_releng_network_vlan_278" {
  provider      = vsphere.mdc2
  name          = "RelEng-RELabs VLAN278"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_278" {
  value = data.vsphere_network.mdc2_releng_network_vlan_278.id
}

# srv.releng.mdc2 vlan248
data "vsphere_network" "mdc2_releng_network_vlan_248" {
  provider      = vsphere.mdc2
  name          = "RelEng-SRV VLAN248"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_248" {
  value = data.vsphere_network.mdc2_releng_network_vlan_248.id
}

# test.releng.mdc2 vlan256
data "vsphere_network" "mdc2_releng_network_vlan_256" {
  provider      = vsphere.mdc2
  name          = "RelEng-Test VLAN256"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_256" {
  value = data.vsphere_network.mdc1_releng_network_vlan_256.id
}

# tier3.releng.mdc2 vlan260
data "vsphere_network" "mdc2_releng_network_vlan_260" {
  provider      = vsphere.mdc2
  name          = "RelEng-Tier3 VLAN260"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_260" {
  value = data.vsphere_network.mdc2_releng_network_vlan_260.id
}

# wintest.releng.mdc2 vlan240
data "vsphere_network" "mdc2_releng_network_vlan_240" {
  provider      = vsphere.mdc2
  name          = "RelEng-Wintest VLAN240"
  datacenter_id = "${data.vsphere_datacenter.mdc2.id}"
}
output "mdc2_releng_network_vlan_240" {
  value = data.vsphere_network.mdc2_releng_network_vlan_240.id
}





