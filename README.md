# tf
terraform configuration files and scripts

# use
Currently used to populate tenant AWS account with appropriate resources linked to master AWS account

## Download terraform

```shell
mkdir terraform
cd terraform
wget https://releases.hashicorp.com/terraform/0.7.0/terraform_0.7.0_linux_amd64.zip
```

## Unzip terraform

```shell
unzip terraform_0.7.0_linux_amd64.zip
```

## Add terraform to PATH

```shell
export PATH=$PATH:/terraform
```

## Clone this repo

```shell
git clone https://github.com/ewierschke/tf
```

## Populate variables.tf file

```shell
cd tf
vi variables.tf
```

## Run terraform

```
terraform plan
terraform apply
```
