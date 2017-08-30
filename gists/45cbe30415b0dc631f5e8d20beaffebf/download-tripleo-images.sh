#!/bin/sh
mkdir -p /var/lib/oooq-images
curl --location -C - -o /var/lib/oooq-images/undercloud-mitaka.qcow2 http://artifacts.ci.centos.org/artifacts/rdo/images/mitaka/delorean/stable/undercloud.qcow2
curl --location -C - -o /var/lib/oooq-images/undercloud-mitaka.qcow2.md5 http://artifacts.ci.centos.org/artifacts/rdo/images/mitaka/delorean/stable/undercloud.qcow2.md5
