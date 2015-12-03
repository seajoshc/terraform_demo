# Overview
WARNING:  LAUNCHING THIS WILL COST YOU MONEY

This is a demo of using Terraform (https://terraform.io) to provision a sample AWS architecture.  Using this will cost you money.

WARNING:  LAUNCHING THIS WILL COST YOU MONEY

# Before You Begin
In addition to all files in this repository, you will need to create an additional file named `terraform.tfvars` to store required variables.  The variables you need to add are:
* access_key
* secret_key
* region
* key_name
* ip_range (optional)

The 'ip_range' variable should be the range you will be connecting to the instances from.  This is used to lock down SSH access to the hosts.  You should never allow 0.0.0.0/0 for inbound remote access to your hosts!

The file should look something like:

```
access_key = "your_access_key"
secret_key = "your_secret_key"
region = "us-west-2"
key_name = "your_keypair_name"
ip_range = "192.168.1.0/24"
```

# Launching
1. terraform get
2. terraform plan
3. terraform apply
