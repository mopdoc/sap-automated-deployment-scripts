module "vpc" {
# source		= "./modules/vpc"   		# Uncomment only this line for creating a NEW VPC #
  source		= "./modules/vpc/existing"	# Uncomment only this line to use an EXISTING VPC #

  ZONE			= var.ZONE
  VPC			= var.VPC
  SECURITYGROUP = var.SECURITYGROUP
  SUBNET		= var.SUBNET
}

module "db-vsi" {
  source		= "./modules/db-vsi"
  depends_on	= [ module.vpc ]
  ZONE			= var.ZONE
  VPC			= var.VPC
  SECURITYGROUP = var.SECURITYGROUP
  SUBNET		= var.SUBNET
  HOSTNAME		= var.DB-HOSTNAME
  PROFILE		= var.DB-PROFILE
  IMAGE			= var.DB-IMAGE
  SSH_KEYS		= var.SSH_KEYS
  VOLUME_SIZES	= [ "32" , "32", "64", "128", "256" ]
  VOL_PROFILE		= "10iops-tier"
}

module "app-vsi" {
  source		= "./modules/app-vsi"
  depends_on	= [ module.vpc ]
  ZONE			= var.ZONE
  VPC			= var.VPC
  SECURITYGROUP = var.SECURITYGROUP
  SUBNET		= var.SUBNET
  HOSTNAME		= var.APP-HOSTNAME
  PROFILE		= var.APP-PROFILE
  IMAGE			= var.APP-IMAGE
  SSH_KEYS		= var.SSH_KEYS
  VOLUME_SIZES	= [ "40" , "128" ]
  VOL_PROFILE	= "10iops-tier"
}

module "ascs-ansible-exec" {
  source		= "./modules/ansible-exec"
  depends_on	= [ module.app-vsi , local_file.app_ansible_sapnwascs-vars ]
  IP			= module.app-vsi.PRIVATE-IP
  PLAYBOOK_PATH = "../ansible/sapnwascs.yml"
}

module "db-ansible-exec" {
  source		= "./modules/ansible-exec"
  depends_on	= [ module.ascs-ansible-exec, module.db-vsi , local_file.db_ansible_sapnwdb-vars ]
  IP			= module.db-vsi.PRIVATE-IP
  PLAYBOOK_PATH = "../ansible/sapnwdb.yml"
}

module "app-ansible-exec" {
  source		= "./modules/ansible-exec"
  depends_on	= [ module.db-ansible-exec , module.app-vsi , local_file.app_ansible_sapnwapp-vars ]
  IP			= module.app-vsi.PRIVATE-IP
  PLAYBOOK_PATH = "../ansible/sapnwapp.yml"
}

module "sec-exec" {
  source		= "./modules/sec-exec"
  depends_on	= [ module.app-ansible-exec ]
  IP			= module.app-vsi.PRIVATE-IP
  sap_master_password = var.sap_master_password
}
