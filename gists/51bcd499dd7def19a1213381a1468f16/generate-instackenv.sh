#!/bin/bash

cat > instackenv-baremetal.json << EOF
{
  "nodes":[
  {
    "_comment": "ooo1",
    "pm_type":"pxe_ipmitool",
    "mac": [
        "00:26:9e:9b:c3:36"
    ],
    "cpu": "16",
    "memory": "65536",
    "disk": "370",
    "arch": "x86_64",
    "pm_user":"root",
    "pm_password":"admin",
    "pm_addr":"10.0.108.126",
    "capabilities": "profile:compute,boot_option:local"
  },
  {
    "_comment": "ooo2",
    "pm_type":"pxe_ipmitool",
    "mac": [
        "00:26:9e:9c:38:a6"
    ],
    "cpu": "16",
    "memory": "32768",
    "disk": "929",
    "arch": "x86_64",
    "pm_user":"root",
    "pm_password":"admin",
    "pm_addr":"10.0.108.127",
    "capabilities": "profile:control,boot_option:local"
  }
  ]
}
EOF

json_verify < instackenv-baremetal.json
