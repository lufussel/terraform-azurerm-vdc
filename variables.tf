# --------------------------------------------------------
# Global variables
# --------------------------------------------------------

variable "env" {
  description = "Short code for the environment."
  default     = "gh"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"

  default = {
    application = "vdc-hub"
    environment = "development"
    buildagent = "github-actions"
  }
}

# --------------------------------------------------------
# Properties for the hub network
# --------------------------------------------------------

variable "hub_vnet_name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  default     = "hub-network"
}

variable "hub_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "hub-network-rg"
}

variable "hub_address_space" {
  description = "The address space that is used for the virtual network. You can supply more than one address space."
  default     = ["10.100.0.0/16"]
}

variable "hub_dns_servers" {
  description = "List of IP addresses of DNS servers. If no values specified, this defaults to Azure DNS."
  default     = []
}

variable "firewall_subnet_prefix" {
  description = "The address prefix to associate to the firewall subnet."
  default     = "10.100.0.0/24"
}

# --------------------------------------------------------
# Azure Bastion properties (in development)
# --------------------------------------------------------

variable "bastion_subnet_prefix" {
  description = "The address prefix to associate to the bastion subnet."
  default     = "10.100.1.0/24"
}

variable "firewall_name" {
  description = "The name of the firewall. Changing this forces a new resource to be created."
  default     = "hub-firewall"
}

variable "bastion_name" {
  description = "The name of the bastion. Changing this forces a new resource to be created."
  default     = "hub-bastion"
}

# --------------------------------------------------------
# VPN gateway and gateway network properties
# --------------------------------------------------------

variable "gateway_name" {
  description = "The name of the virtual network gateway. Changing this forces a new resource to be created."
  default     = "hub-gateway"
}

variable "gateway_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network gateway."
  default     = "hub-gateway-rg"
}

variable "gateway_vnet_name" {
  description = "The name of the virtual network in which to create the virtual network gateway. Changing this forces a new resource to be created."
  default     = "hub-gateway-network"
}

variable "gateway_address_space" {
  description = "The address space that is used for the virtual network gateway. You can supply more than one address space."
  default     = ["10.250.0.0/22"]
}

variable "gateway_subnet_prefix" {
  description = "The address prefix to associate to the gateway subnet."
  default     = "10.250.0.0/24"
}

variable "local_gateway_name" {
  description = "The name of the local gateway. Changing this forces a new resource to be created."
  default     = "on-premises-gateway"
}

variable "local_gateway_public_ip" {
  description = "The IP address of the local gateway."
  default     = "123.123.123.123"
}

variable "local_gateway_address_space" {
  description = "The address space of the local gateway."
  default     = ["10.0.0.0/16"]
}

variable "gateway_connection_shared_key" {
  description = "The shared key used for the gateway connection. Do not store this key in source control."
  default     = ""
}

# --------------------------------------------------------
# Properties for default route table (in development)
# --------------------------------------------------------

variable "nsg_resource_group_name" {
  description = "The name of the resource group in which to create the network security groups."
  default     = "hub-nsg-rg"
}

variable "route_table_resource_group_name" {
  description = "The name of the resource group in which to create route tables."
  default     = "hub-route-table-rg"
}

variable "route_table_default_gateway_ip_address" {
  description = "The IP address used for the default gateway, such as a network virtual appliance or firewall."
  default     = "10.100.0.4"
}

# --------------------------------------------------------
# Properties of domain subnet
# --------------------------------------------------------

variable "domain_subnet_name" {
  description = "The name of the domain subnet. Changing this forces a new resource to be created."
  default     = "activedirectory"
}

variable "domain_subnet_prefix" {
  description = "The address prefix to associate to the domain subnet."
  default     = "10.100.5.0/24"
}

variable "domain_route_table_name" {
  description = "The name of the domain subnet. Changing this forces a new resource to be created."
  default     = "hub-network-activedirectory-route-table"
}

variable "domain_nsg_name" {
  description = "The name of the network security group. Changing this forces a new resource to be created."
  default     = "hub-network-activedirectory-nsg"
}

variable "domain_nsg_rules" {
  description = "Rules to apply to the network security group."
  default     = [
    {
      name                        = "allow-rpc"
      priority                    = "1000"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "135"
      destination_address_prefix  = "*"
      description                 = "Allow RPC Endpoint Mapper inbound"
    },
    {
      name                        = "allow-ldap"
      priority                    = "1010"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "389"
      destination_address_prefix  = "*"
      description                 = "Allow LDAP inbound"
    },
    {
      name                        = "allow-ldap-ssl"
      priority                    = "1020"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "636"
      destination_address_prefix  = "*"
      description                 = "Allow LDAP SSL inbound"
    },
    {
      name                        = "allow-ldap-gc"
      priority                    = "1030"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "3268"
      destination_address_prefix  = "*"
      description                 = "Allow LDAP GC inbound"
    },
    {
      name                        = "allow-ldap-gc-ssl"
      priority                    = "1040"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "3269"
      destination_address_prefix  = "*"
      description                 = "Allow LDAP GC SSL inbound"
    },
    {
      name                        = "allow-dns"
      priority                    = "1050"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "53"
      destination_address_prefix  = "*"
      description                 = "Allow DNS inbound"
    },
    {
      name                        = "allow-kerberos"
      priority                    = "1060"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "88"
      destination_address_prefix  = "*"
      description                 = "Allow Kerberos inbound"
    },
    {
      name                        = "allow-smb"
      priority                    = "1070"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "445"
      destination_address_prefix  = "*"
      description                 = "Allow SMB inbound"
    },
    {
      name                        = "allow-windowstime"
      priority                    = "1100"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Udp"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "123"
      destination_address_prefix  = "*"
      description                 = "Allow W32Time inbound"
    },
    {
      name                        = "allow-kerberos-pc"
      priority                    = "1110"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "VirtualNetwork"
      destination_port_ranges     = "464"
      destination_address_prefix  = "*"
      description                 = "Allow Kerberos password change inbound"
    },
    {
      name                        = "allow-rdp"
      priority                    = "2000"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "10.100.6.0/24"
      destination_port_ranges     = "3389"
      destination_address_prefix  = "*"
      description                 = "Allow RDP inbound from Management"
    },
    {
      name                        = "allow-powershellremoting"
      priority                    = "2010"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "10.100.6.0/24"
      destination_port_ranges     = "5985-5986"
      destination_address_prefix  = "*"
      description                 = "Allow WinRM and PowerShell Remoting inbound from Management"
    },
    {
      name                        = "deny-all"
      priority                    = "4000"
      direction                   = "Inbound"
      access                      = "Deny"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "*"
      destination_port_ranges     = "*"
      destination_address_prefix  = "*"
      description                 = "Deny unmatched inbound traffic"
    }
  ]
}

# --------------------------------------------------------
# Properties of management subnet
# --------------------------------------------------------

variable "management_subnet_name" {
  description = "The name of the management subnet. Changing this forces a new resource to be created."
  default     = "management"
}

variable "management_subnet_prefix" {
  description = "The address prefix to associate to the management subnet."
  default     = "10.100.6.0/24"
}

variable "management_route_table_name" {
  description = "The name of the management subnet. Changing this forces a new resource to be created."
  default     = "hub-network-management-route-table"
}

variable "management_nsg_name" {
  description = "The name of the network security group. Changing this forces a new resource to be created."
  default     = "hub-network-management-nsg"
}

variable "management_nsg_rules" {
  description = "Rules to apply to the network security group."
  default     = [
    {
      name                        = "allow-rdp"
      priority                    = "1000"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "10.100.1.0/24"
      destination_port_ranges     = "3389"
      destination_address_prefix  = "*"
      description                 = "Allow RDP inbound from Bastion"
    },
    {
      name                        = "allow-ssh"
      priority                    = "1010"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_ranges          = "*"
      source_address_prefix       = "10.100.1.0/24"
      destination_port_ranges     = "22"
      destination_address_prefix  = "*"
      description                 = "Allow RDP inbound from Bastion"
    },
    {
      name                        = "deny-all"
      priority                    = "4000"
      direction                   = "Inbound"
      access                      = "Deny"
      protocol                    = "*"
      source_port_ranges          = "*"
      source_address_prefix       = "*"
      destination_port_ranges     = "*"
      destination_address_prefix  = "*"
      description                 = "Deny unmatched inbound traffic"
    }
  ]
}
