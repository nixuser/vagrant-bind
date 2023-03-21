#!/bin/bash

sudo dnf install -y ansible-core
export ANSIBLE_HOST_KEY_CHECKING=False
cd /vagrant
grep ip: Vagrantfile | awk '{print $4}' | tr -d '",' > hosts
ansible-playbook -i hosts provisioning/hosts.yml
ansible-playbook -i /home/vagrant/inventory provisioning/playbook.yml
