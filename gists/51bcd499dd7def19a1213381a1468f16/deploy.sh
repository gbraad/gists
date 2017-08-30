#!/bin/bash

./generate-instackenv.sh
./deploy-baremetal.sh

# Could be done with tags... but this is just here to describe what happens.
ssh -F .quickstart/ssh.config.ansible undercloud -C "./undercloud-install.sh"
ssh -F .quickstart/ssh.config.ansible undercloud -C "./undercloud-post-install.sh"

ssh -F .quickstart/ssh.config.ansible undercloud -C ". stackrc && openstack baremetal introspection bulk start"

ssh -F .quickstart/ssh.config.ansible undercloud -C "./overcloud-deploy.sh"
ssh -F .quickstart/ssh.config.ansible undercloud -C "./overcloud-deploy-post.sh"