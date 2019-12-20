# role-controller

## Require
terraform version ~> 0.12.6

## Terraform Install

Install tfenv
```
$ brew install tfenv
```
Install Terraform
```
$ tfenv install 0.12.6
$ tfenv use 0.12.6
```
Confirm Terraform
```
$ terraform --version
```


## Generate Backend
`./generate_backend.sh -a hoge -b fuga -r ap-northeast-1 -s staging`
    
## Init
`$ terraform init`

## Plan
`$ terraform plan -out plan.out`

## Apply
`$ terraform apply plan.out`
