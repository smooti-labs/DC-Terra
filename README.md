## Quick Start

### Configure Environment Variables

```powershell
$env:TF_VAR_vsphere_user = 'MyUserName'
$env:TF_VAR_vsphere_password = 'MyPassword'
```

```bash
export TF_VAR_vsphere_user='MyUserName'
export TF_VAR_vsphere_password='MyPassword'
```

### Initialize Terraform 

```bash
terraform init # Initialize terraform directory

terraform apply # Apply terraform
```