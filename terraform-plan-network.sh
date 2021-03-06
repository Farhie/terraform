#!/usr/bin/env bash

set -e

[ -z "$1" ] && echo "environment argument missing (e.g development)" && exit 1

ENVIRONMENT="$1"

rm -rf .terraform
cd infrastructure/network
rm -rf .terraform
terraform get
terraform init
rm -f terraform.tfstate*
terraform plan -var-file=../../environment/${ENVIRONMENT}/${ENVIRONMENT}.tfvars