.
├── main.tf                # Root module orchestrating child modules
├── variables.tf           # Input variables
├── locals.tf              # Local values for merging tags and filtering env
├── terraform.tfvars       # Environment configurations and common tags
├── outputs.tf             # Outputs for selected environment
└── modules/
    ├── resource_group/
    ├── vnet/
    ├── subnet/
    └── virtual_machine/

✔ Deploy single environment (dev or qa) via CLI
✔ Modular design for Resource Group, VNet, Subnet, and VM
✔ Dynamic tag merging: common_tags + environment-specific tags
✔ Capture important outputs like RG name, VNet name, Subnet ID, and VM names


⚙️ Prerequisites
Terraform >= 1.3
Azure CLI (az login)
SSH key pair (~/.ssh/id_rsa.pub)


📌 Configuration
Variables
env → The environment to deploy (dev or qa)
environments → Map of environment-specific configurations
common_tags → Common tags for all resources


terraform init

terraform plan -var="env=dev"

terraform destroy -var="env=dev"
