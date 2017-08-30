#!/bin/bash
export VIRTHOST=server-124.local

./quickstart.sh \
   --config deploy-baremetal.yml \
   -e undercloud_instackenv_template=../../../instackenv-baremetal.json \
   -e undercloud_image_url=file:///var/lib/oooq-images/undercloud-mitaka.qcow2 \
   $VIRTHOST
   