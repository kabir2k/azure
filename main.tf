module "resource_group" {
  source = "/home/user/azure_studying/vm_terraform/modules/resource_group"
}

module "network" {
   source = "/home/user/azure_studying/vm_terraform/modules/vm_network"
   location = module.resource_group.location.location
    name = module.resource_group.name
}


module "linux" {
  source = "/home/user/azure_studying/vm_terraform/modules/linux-machine"
  location = module.resource_group.location.location
   resource_group_name = module.resource_group.name
   subnet_id = module.network.subnet
}