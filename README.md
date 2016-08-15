# tf
terraform configuration files and scripts

# Use
Currently used to populate tenant AWS account with appropriate resources linked to master AWS account
Can also be used by renaming files for execution to populate master AWS account with certain resources to enable tenant account access

Be careful not to commit populated variables.tf file to github

## Prep

```shell
yum -y install wget unzip git
```

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

## Rename and populate variables.tf file

```shell
cd tf
mv variables.tf.template variables.tf
vi variables.tf
```

## Run terraform

```
terraform get
terraform plan
terraform apply
```
