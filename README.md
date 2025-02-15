# IBM SAP Cloud Solution Automated Deployment scripts: Virtual Private Cloud
#test doizece doizece
The templates in this repo are used to deploy different SAP scenarios like:

- [Creating single-tier virtual private cloud for SAP by using Terraform](https://github.com/IBM-Cloud/sap-automated-deployment-scripts/tree/master/sapsingletiervpc)

- [Automatic deployment of SAP (NW7.X/DB2 on Unix) certified IaaS with storage and network configurations using Reference Architecture - single tier](https://github.com/IBM-Cloud/sap-automated-deployment-scripts/tree/master/sapsingletierdb2)


The main repo contains different directories with examples of using various SAP IBM Cloud services based on  Terraform&Ansible deployment tools. Each of the examples has their own README containing more details on what the example does.

To run any example, clone the repository for the targeted branch (the default one is master)  and run terraform commands within the example's own directory.

`git clone -b <branchname> <remote-repo-url>`
 
For example:
```
$ git clone https://github.com/IBM-Cloud/sap-automated-deployment-scripts.git
$ cd sap-automated-deployment-scripts/sapsingletiervpc
$ terraform plan
$ terraform apply
...
```

## Related links:

- [Preparing your deployment server with terraform&ansible](https://github.com/IBM-Cloud/terraform-provider-ibm)

- [Creating a bastion server in your VPC](https://github.com/IBM-Cloud/vpc-tutorials/tree/master/vpc-secure-management-bastion-server)
