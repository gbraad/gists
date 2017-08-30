cat > /etc/hosts <<EOF
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.1.101  ooo1 ooo1.test.spotsnel.int
192.168.1.102  ooo2 ooo2.test.spotsnel.int
192.168.1.103  ooo3 ooo3.test.spotsnel.int
EOF

useradd stack
echo "stack" | passwd --stdin stack
echo "stack ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/stack
sudo chmod 0440 /etc/sudoers.d/stack

su - stack
sudo yum -y install epel-release  yum-plugin-priorities 
sudo curl -o /etc/yum.repos.d/delorean.repo http://trunk.rdoproject.org/centos7/current-tripleo/delorean.repo
sudo curl -o /etc/yum.repos.d/delorean-current.repo http://trunk.rdoproject.org/centos7/current/delorean.repo
sudo sed -i 's/\[delorean\]/\[delorean-current\]/' /etc/yum.repos.d/delorean-current.repo
sudo /bin/bash -c "cat <<EOF>>/etc/yum.repos.d/delorean-current.repo
includepkgs=diskimage-builder,openstack-heat,instack,instack-undercloud,openstack-ironic,openstack-ironic-inspector,os-cloud-config,os-net-config,python-ironic-inspector-client,python-tripleoclient,tripleo-common,openstack-tripleo-heat-templates,openstack-tripleo-image-elements,openstack-tuskar-ui-extras,openstack-puppet-modules
EOF"

sudo curl -o /etc/yum.repos.d/delorean-deps.repo http://trunk.rdoproject.org/centos7/delorean-deps.repo
sudo yum install -y python-tripleoclient

cat > ~/undercloud.conf <<EOF
[DEFAULT]
local_interface = eth0
[auth]
EOF

openstack undercloud install 2>&1 | tee undercloud_install.log

export NODE_DIST=centos7
export USE_DELOREAN_TRUNK=1
export DELOREAN_TRUNK_REPO="http://trunk.rdoproject.org/centos7/current-tripleo/"
export DELOREAN_REPO_FILE="delorean.repo"
time openstack overcloud image build --all 2>&1 | tee build_images.log

openstack overcloud image upload

cat > instackenv.json << EOF
{
  "nodes":[
  {
    "_comment":"ooo2",
    "pm_type":"pxe_ipmi",
    "mac": [
        "ec:a8:6b:fa:65:c7"
    ],
    "cpu": "2",
    "memory": "4000",
    "disk": "100",
    "arch": "x86_64",
    "pm_user":"admin",
    "pm_password":"admin",
    "pm_addr":"192.168.1.102"
  },
  {
    "_comment":"ooo3",
    "pm_type":"pxe_ipmi",
    "mac": [
        "b8:ae:ed:71:3e:20"
    ],
    "cpu": "2",
    "memory": "4000",
    "disk": "100",
    "arch": "x86_64",
    "pm_user":"admin",
    "pm_password":"admin",
    "pm_addr":"192.168.1.103"
  }
  ]
}
EOF
json_verify < instackenv.json

openstack baremetal import --json instackenv.json
openstack baremetal configure boot

openstack baremetal introspection bulk start
openstack overcloud deploy --templates