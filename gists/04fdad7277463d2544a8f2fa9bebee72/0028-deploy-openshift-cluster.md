---
Title: Deploy an OpenShift cluster
Date: 2016-11-21
Category: Containers
Tags: containers, openshift, deployment, devops, cluster, ansible
---

In previous articles I have described how to [setup a test cluster](http://gbraad.nl/blog/deploy-an-openshift-test-cluster.html) for OpenShift and how the deployment of an [example application](http://gbraad.nl/blog/run-an-example-application-on-openshift.html) works using source-to-image. In this article, I am going to setup OpenShift using the Ansible playbooks.



```
sudo yum install -y epel-release
sudo yum install -y pyOpenSSL ansible git
```

```
git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible
```

```
cp ansible.cfg.example ansible.cfg
vi inventory/byo/hosts
```

```ini
[OSEv3:children]
masters
nodes

[OSEv3:vars]
ansible_ssh_user=centos
ansible_become=true
deployment_type=origin
deployment_subtype=registry
openshift_release=v1.3.1
openshift_install_examples=true
openshift_public_ip=89.42.141.147
#containerized=true
osm_default_subdomain=origin.spotsnel.net
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/master/htpasswd'}]
openshift_master_htpasswd_users={'demo': '$apr1$.MaA77kd$Rlnn6RXq9kCjnEfh5I3w/.'}

openshift_hosted_router_selector='region=infra'
openshift_hosted_registry_selector='region=infra'
openshift_master_default_subdomain=origin.spotsnel.net
osm_default_node_selector='region=primary'

[masters]
master.spotsnel.net openshift_public_hostname="master.spotsnel.net"

[nodes]
master.spotsnel.net openshift_schedulable=True
10.5.0.50 openshift_node_labels="{'region': 'infra', 'zone': 'default'}"
10.5.0.53 openshift_node_labels="{'region': 'primary', 'zone': 'default'}"
10.5.0.52 openshift_node_labels="{'region': 'primary', 'zone': 'default'}"
10.5.0.51 openshift_node_labels="{'region': 'primary', 'zone': 'default'}"
```

```
ansible -i hosts nodes -u centos -s -m shell -a \
        "yum install -y NetworkManager && systemctl enable NetworkManager && systemctl disable network && reboot"
```

```
ansible-playbook -i hosts ~/openshift-ansible/playbooks/byo/config.yml
```

```
vi /etc/origin/master/master-config.yaml
htpasswd /etc/origin/htpasswd admin
```

```
oc get nodes
```