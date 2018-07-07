#!/bin/bash

# prints a crypted password like sa5snuFEEEqVg
# perl -e 'print crypt("somepass", "salt"),"\n"'

# adds user with addition to wheel group and the crypted passwod
# (this one is same as my atmosphere login pass)
useradd -G wheel -p 'saE1mpXXrNfR.' ansible

# allow wheel group users to login
sed -i 's/AllowGroups/AllowGroups wheel/' /etc/ssh/sshd_config
systemctl restart sshd

# let ansible sudo without a password
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
