#!/bin/bash

echo "**** Deploying NSX-T infrastructure ****"
ansible-playbook ./00-DeployNSXT/deploy.yml


echo "************ Configure NSX-T Topology ************"
cd 01-ConfigureNSXT/

echo "******** Terraform Init - NSX-T Topology ********"
terraform init

echo "******** Terraform Plan - NSX-T Topology ********"
terraform plan -out "test.tfplan"

echo "******** Terraform Apply - NSX-T Topology ********"
terraform apply "test.tfplan"

read -t 120 -p "Script paused for 2 minutes while objects are being deployed in NSX"

echo "************ Deploy Virtual Machines ************"
cd ..
cd 02-DeployVM

echo "******** Terraform Init - Deploy Virtual Machines ********"
terraform init

echo "******** Terraform Plan - Deploy Virtual Machines ********"
terraform plan -out "test.tfplan"

echo "******** Terraform Apply - Deploy Virtual Machines ********"
terraform apply "test.tfplan"





echo "************ Changing Network Settings on Cumulus VX ************"
cd .. 
cd 03-ChangeCumulus
/usr/bin/pwsh migrate_cumulus_vnic.ps1 


echo "************ Configure Cumulus VX ************"

#ansible-playbook -k --ask-become-pass --extra-vars "ansible_user=nmichel" ./04-ConfigureCumulus/deploy.yml
#ansible-playbook -k --ask-become-pass ./04-ConfigureCumulus/deploy.yml
cd ..
cd 04-ConfigureCumulus
ansible-playbook -k --ask-become-pass deploy.yml

