#!/bin/bash
echo 
echo "Setting up Vagrant"
echo 

vagrant up

echo 
echo "Setting up Ansible configuration to access Vagrant"
echo 

SSH_DETAILS=$(vagrant ssh-config)
cp ansible/hosts{.template,}

get_config_var() {
    echo "$(echo "${SSH_DETAILS}" | grep "$1" | head -n 1| awk '{print $2}' | sed -e 's/[\/&]/\\&/g')"
}

VAGRANT_HOST=$(get_config_var "HostName")
VAGRANT_USER=$(get_config_var "User") 
VAGRANT_IDENTITY_FILE=$(get_config_var "IdentityFile")
VAGRANT_PORT=$(get_config_var "Port")

sed -i '' "s/<VAGRANT_HOST>/${VAGRANT_HOST}/g" ./ansible/hosts
sed -i '' "s/<VAGRANT_USER>/${VAGRANT_USER}/g" ./ansible/hosts
sed -i '' "s/<VAGRANT_PORT>/${VAGRANT_PORT}/g" ./ansible/hosts
sed -i '' "s/<VAGRANT_IDENTITY_FILE>/${VAGRANT_IDENTITY_FILE}/g" ./ansible/hosts

echo 
echo "All done, testing connection"
echo 

ansible ansible-workshop-vagrant -m ping
ansible ansible-workshop-vagrant -a '/bin/echo "hello from vagrant"'
