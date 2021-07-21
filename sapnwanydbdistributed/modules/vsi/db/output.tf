
output "DB-HOSTNAME" {
  value		= ibm_is_instance.vsi-db.name
}

output "DB-FLOATING-IP" {
  value		= ibm_is_floating_ip.fip.address
}

output "DB-PRIVATE-IP" {
  value		= ibm_is_instance.vsi-db.primary_network_interface[0].primary_ipv4_address
}
