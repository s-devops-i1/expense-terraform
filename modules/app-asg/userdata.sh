#!/bin/bash

pip3.11 install ansible hvac  &>>/opt/ansible.log
ansible-pull -i localhost, -U https://github.com/s-devops-i1/expense-ansible.git -e env=${env} -e role_name=${component} get-secrets.yml -e vault_token=${vault_token} &>>/opt/ansible.log
ansible-pull -i localhost, -U https://github.com/s-devops-i1/expense-ansible.git -e env=${env} -e role_name=${component} expense-play.yml -e @~/secrets.json &>>/opt/ansible.log

