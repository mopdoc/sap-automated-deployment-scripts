# General VPC variables:
REGION			= "eu-de"
ZONE			= "eu-de-2"
VPC				= "ic4sap"
SECURITYGROUP	= "ic4sap-securitygroup"
SUBNET			= "ic4sap-subnet"
HOSTNAME		= "bastion"
PROFILE			= "bx2-2x8"
IMAGE			= "ibm-redhat-8-4-minimal-amd64-1"
SSH_KEYS		= [ "r010-57bfc315-f9e5-46bf-bf61-d87a24a9ce7a" , "r010-3fcd9fe7-d4a7-41ce-8bb3-d96e936b2c7e" , "r010-771e15dd-8081-4cca-8844-445a40e6a3b3" , "r010-09325e15-15be-474e-9b3b-21827b260717" , "r010-7945f2b4-06f2-4276-8d8f-d40922a8686d" , "r010-5cfdb578-fc66-4bf7-967e-f5b4a8d03b89" ]
VOL1			= "100" # the default minimal recommended value is 100 GB
