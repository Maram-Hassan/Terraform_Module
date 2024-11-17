
## Prerequisites

Before using , ensure that you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.x or higher)
- [Git](https://git-scm.com/downloads) (if you're cloning the repository)

## Setup Instructions

### 1. Clone the Repository (optional)

If you'd like to clone this repository to your local machine, use the following command:

```bash
git clone https://github.com/Maram-Hassan/terraform_module.git
cd terraform_module
```

### 2. Initialize Terraform

In your Terraform configuration directory (where you have the module reference), initialize the working directory to download the necessary provider plugins and dependencies:

```bash
terraform init
```

### 3. Run Terraform Plan

Use the `terraform plan` command to see what changes Terraform will make to your infrastructure:

```bash
terraform plan
```

Terraform will generate an execution plan and show you what resources will be created, modified, or destroyed.

### 4. Apply the Changes

To apply the plan and create the resources, run:

```bash
terraform apply
```

Terraform will prompt you to confirm before applying the changes. Type `yes` to proceed.

### 5. Check the Outputs

After applying the Terraform plan, you can view the output values defined in your module:

```bash
terraform output
```

This will display any output variables defined in the module, such as IDs, URLs, or other resource details.

### 6. Destroy the Resources (optional)

If you need to tear down the resources you've created, you can use the `terraform destroy` command:

```bash
terraform destroy
```

This will destroy all the resources that were created by the Terraform configuration. Confirm by typing `yes` when prompted.



