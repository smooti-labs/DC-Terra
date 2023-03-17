## Configure Environment Variables

```powershell
$env:VSPHERE_USER = 'MyUserName'
$env:VSPHERE_PASSWORD = 'MyPassword'
$env:VSPHERE_SERVER = 'myvcenter.local'
$env:TF_VAR_dsrm_password = 'myDSRMpassword'
$env:VSPHERE_ALLOW_UNVERIFIED_SSL='true' # OPTIONAL
```

```bash
export VSPHERE_USER='MyUserName'
export VSPHERE_PASSWORD='MyPassword'
export VSPHERE_SERVER='myvcenter.local'
export TF_VAR_dsrm_password='myDSRMpassword'
export VSPHERE_ALLOW_UNVERIFIED_SSL='true' # OPTIONAL
```
