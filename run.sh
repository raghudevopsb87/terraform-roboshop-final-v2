if [ "$1" == "dev" ]; then
  rm -f .terraform/terraform.tfstate
  terraform init -backend-config=env-dev/state.tfvars
  if [ "$2" == "destroy" ]; then
    terraform destroy -auto-approve -var-file=env-dev/main.tfvars
  else
    terraform apply -auto-approve -var-file=env-dev/main.tfvars
  fi
fi

if [ "$1" == "prod" ]; then
  rm -f .terraform/terraform.tfstate
  terraform init -backend-config=env-prod/state.tfvars
  if [ "$2" == "destroy" ]; then
    terraform destroy -auto-approve -var-file=env-prod/main.tfvars
  else
    terraform apply -auto-approve -var-file=env-prod/main.tfvars
  fi
fi

