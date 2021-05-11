#!/bin/sh
###########################################################################
# Author: Kiran Rajanna
# Date: 10-May-2021
# Version: 1.1
# Description - Script to add rapid7 accounts and directories on EC2 instances  
#
###########################################################################
echo "Adding users and groups"
groupadd -g 3001 cmips2
groupadd -g 7001 rapid7.admin
useradd --uid 6010 --no-user-group --gid rapid7.admin --groups cmips2 --home-dir '/home/rapid7.admin' --comment "Rapid7 Admin user" rapid7.admin
usermod -a -G cmips2 rapid7.admin
echo "Adding users and groups completed"

mkdir -p /home/rapid7.admin/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBcQlIPrGF78lAFrqY+5+1hx0yF32MVXUaUdrmuv8w8ahhbD8JCHSayYvZJFi2hSz34HwyiP/bHAN/TmnPchzJoQlfL3Z4d7VY1y+9qkeJeAxL5mJ8Y0/oc6+dujqy6ItvvUbEran6vZTdARvDCVm9e+ksJYE5mJ52Jwajdz/8uFhL4vqQpPnHfK/Yi2oDdHEd03z52ynHgYqV85lyRlSPDvocfiZXBDTL+UaiFQHgpXcMjBFsST0aKY/Dhd8OZnvH2M+KoIDANxZsGXEyyaRJI4+F9xjZKI1h4edtkUY1jFsLXHhvNiWw8YDeOc8iI0q6D2tM3bnKBn4uBAjI9Cnov CMIPS AWS Linux" >> /home/rapid7.admin/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlpn4WTiErJwrog8WppbbY9bcXDMCk1xeeWV9nN6fLXqGoqXYUR97H3zp5wziX/VKox6Y7KVC14xjhDaLC36cfjCyzGUTm1DtfHkfkPzNpiRk5uKbK1p6L3gaQ51Oud4QiPEz8bO0XLaUn96qnR8tlPXPFKhEgHF5Mt4IZMuJ5mrc3gTBOktZIdiQcFPHT2O75wBDjJoP+y+P6jVCKjAG1w8A4mqK3Cpd+KEmLfZopUOOoXHSmqkFpHC9EQdyEYaOoanP2Bsca4Nesq77EyrGfj0XWFguV5m6hpk4mRtOxI7Lqbsw743wGJEwoAcp8t4d0ocCchmn25fEFSZe5ziVhw== rsa-key-20210414 >> /home/ec2-user/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBcQlIPrGF78lAFrqY+5+1hx0yF32MVXUaUdrmuv8w8ahhbD8JCHSayYvZJFi2hSz34HwyiP/bHAN/TmnPchzJoQlfL3Z4d7VY1y+9qkeJeAxL5mJ8Y0/oc6+dujqy6ItvvUbEran6vZTdARvDCVm9e+ksJYE5mJ52Jwajdz/8uFhL4vqQpPnHfK/Yi2oDdHEd03z52ynHgYqV85lyRlSPDvocfiZXBDTL+UaiFQHgpXcMjBFsST0aKY/Dhd8OZnvH2M+KoIDANxZsGXEyyaRJI4+F9xjZKI1h4edtkUY1jFsLXHhvNiWw8YDeOc8iI0q6D2tM3bnKBn4uBAjI9Cnov CMIPS AWS Linux >> /home/ec2-user/.ssh/authorized_keys
chmod 600 /home/rapid7.admin/.ssh/authorized_keys
chown -R rapid7.admin:rapid7.admin /home/rapid7.admin/.ssh/
cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.bck.05072021
echo "Adding rapid7 keys completed"

echo "Adding directories"
mkdir -p /opt/rapid7
cd /opt/rapid7
yum install -y wget unzip
echo "Adding directories completed"
echo "Script completed"