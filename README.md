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

# License
Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at

    http://aws.amazon.com/apache2.0/

or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
