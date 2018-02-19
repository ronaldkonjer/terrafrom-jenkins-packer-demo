#!/bin/sh
# not necessary anymore in newer terraform versions, you can use a backend.tf file
 if [ "`terraform --version |head -n1`" == "Terraform v0.11.3" ] ; then
  terraform remote config -backend=s3 -backend-config="bucket=terraform-state-rk840522" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=eu-west-1"
 fi
