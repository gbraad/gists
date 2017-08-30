## New instance

I just did a clean install of F24 on a new instance

```bash
$ dnf update -y
$ dnf install -y curl docker git
$ vi /etc/sysconfig/docker     # add --insecure-regsitry
$ systemctl start docker
$ curl -sSL https://github.com/openshift/origin/releases/download/v1.3.0/openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit.tar.gz
-o oc-client.tar.gz
$ tar -zxvf oc-client.tar.gz
$ mkdir -p /opt/openshift/client
$ cp ./openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit/oc
/opt/openshift/client/oc
$ export PATH=$PATH:/opt/openshift/client/
$ oc cluster up
$ oc new-app openshift/ruby-20-centos7~https://github.com/openshift/ruby-ex
```

```shell
[root@openshift-test ~]# oc get events
LASTSEEN   FIRSTSEEN   COUNT     NAME              KIND      SUBOBJECT                  TYPE      REASON       SOURCE                 MESSAGE
1m         1m          1         ruby-ex-1-7rzmi   Pod                                  Normal    Scheduled    {default-scheduler }   Successfully assigned ruby-ex-1-7rzmi to 10.3.0.57
33s        1m          3         ruby-ex-1-7rzmi   Pod       spec.containers{ruby-ex}   Normal    Pulling      {kubelet 10.3.0.57}    pulling image "172.30.151.66:5000/myproject/ruby-ex@sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c"
33s        1m          3         ruby-ex-1-7rzmi   Pod       spec.containers{ruby-ex}   Warning   Failed       {kubelet 10.3.0.57}    Failed to pull image "172.30.151.66:5000/myproject/ruby-ex@sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c": Cannot overwrite digest sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c
33s        1m          3         ruby-ex-1-7rzmi   Pod                                  Warning   FailedSync   {kubelet 10.3.0.57}    Error syncing pod, skipping: failed to "StartContainer" for "ruby-ex" with ErrImagePull: "Cannot overwrite digest sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c"

7s        1m        4         ruby-ex-1-7rzmi   Pod       spec.containers{ruby-ex}   Normal    BackOff      {kubelet 10.3.0.57}   Back-off pulling image "172.30.151.66:5000/myproject/ruby-ex@sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c"
7s        1m        4         ruby-ex-1-7rzmi   Pod                                  Warning   FailedSync   {kubelet 10.3.0.57}   Error syncing pod, skipping: failed to "StartContainer" for "ruby-ex" with ImagePullBackOff: "Back-off pulling image \"172.30.151.66:5000/myproject/ruby-ex@sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c\""

3m        3m        1         ruby-ex-1-build    Pod                                                   Normal    Scheduled           {default-scheduler }             Successfully assigned ruby-ex-1-build to 10.3.0.57
3m        3m        1         ruby-ex-1-build    Pod                     spec.containers{sti-build}    Normal    Pulling             {kubelet 10.3.0.57}              pulling image "openshift/origin-sti-builder:v1.3.0"
3m        3m        1         ruby-ex-1-build    Pod                     spec.containers{sti-build}    Normal    Pulled              {kubelet 10.3.0.57}              Successfully pulled image "openshift/origin-sti-builder:v1.3.0"
3m        3m        1         ruby-ex-1-build    Pod                     spec.containers{sti-build}    Normal    Created             {kubelet 10.3.0.57}              Created container with docker id f5a51b8396c4
3m        3m        1         ruby-ex-1-build    Pod                     spec.containers{sti-build}    Normal    Started             {kubelet 10.3.0.57}              Started container with docker id f5a51b8396c4
1m        1m        1         ruby-ex-1-deploy   Pod                                                   Normal    Scheduled           {default-scheduler }             Successfully assigned ruby-ex-1-deploy to 10.3.0.57
1m        1m        1         ruby-ex-1-deploy   Pod                     spec.containers{deployment}   Normal    Pulled              {kubelet 10.3.0.57}              Container image "openshift/origin-deployer:v1.3.0" already present on machine
1m        1m        1         ruby-ex-1-deploy   Pod                     spec.containers{deployment}   Normal    Created             {kubelet 10.3.0.57}              Created container with docker id c7bab09fd063
1m        1m        1         ruby-ex-1-deploy   Pod                     spec.containers{deployment}   Normal    Started             {kubelet 10.3.0.57}              Started container with docker id c7bab09fd063
1m        1m        1         ruby-ex-1          ReplicationController                                 Normal    SuccessfulCreate    {replication-controller }        Created pod: ruby-ex-1-7rzmi
1m        1m        1         ruby-ex            DeploymentConfig                                      Normal    DeploymentCreated   {deploymentconfig-controller }   Created new deployment "ruby-ex-1" for version 1
[root@openshift-test ~]# sudo cat /var/lib/docker/image/devicemapper/repositories.json | python -mjson.tool
{
    "Repositories": {
        "172.30.151.66:5000/myproject/ruby-ex": {
            "172.30.151.66:5000/myproject/ruby-ex:latest": "sha256:97beeb7362a49a0c534be9082babc9b0232a13571d64f17e9db0a62622ee908f",
            "172.30.151.66:5000/myproject/ruby-ex@sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c": "sha256:97beeb7362a49a0c534be9082babc9b0232a13571d64f17e9db0a62622ee908f"
        },
        "docker.io/openshift/origin": {
            "docker.io/openshift/origin:v1.3.0": "sha256:7b24611e640fb1b14bd05861fc908bc9954ec52511043213b506b1774a2d1d40",
            "docker.io/openshift/origin@sha256:da94a0329148f6e7f92f0d2c2683c681ae33aab08809331ac3d580b1a630c992": "sha256:7b24611e640fb1b14bd05861fc908bc9954ec52511043213b506b1774a2d1d40"
        },
        "docker.io/openshift/origin-deployer": {
            "docker.io/openshift/origin-deployer:v1.3.0": "sha256:5bf464732ca803e33e73eb4bc564ad2bf986eaae714211c2a96c669ed009876a",
            "docker.io/openshift/origin-deployer@sha256:18a8e17bc3f435209808903e6d039363ca7127cb28d124b7391e6a74f386ea4d": "sha256:5bf464732ca803e33e73eb4bc564ad2bf986eaae714211c2a96c669ed009876a"
        },
        "docker.io/openshift/origin-docker-registry": {
            "docker.io/openshift/origin-docker-registry:v1.3.0": "sha256:59d447094a3cfd744802b0a3077721a536f8ec945d019b29ef2f55480096b6ba",
            "docker.io/openshift/origin-docker-registry@sha256:1b36b8ba2fc3905739eab420641d7d4c14cdd8c3a855c62d77d1cc0ea0a141ab": "sha256:59d447094a3cfd744802b0a3077721a536f8ec945d019b29ef2f55480096b6ba"
        },
        "docker.io/openshift/origin-haproxy-router": {
            "docker.io/openshift/origin-haproxy-router:v1.3.0": "sha256:e33d4e33dffb92f71848233aa44db76170f42c06ffaedff5ac1971976cb3caba",
            "docker.io/openshift/origin-haproxy-router@sha256:267f8c852a67c105aa480ff811a10fb29bf378b22b5d350e98984f8cca002aba": "sha256:e33d4e33dffb92f71848233aa44db76170f42c06ffaedff5ac1971976cb3caba"
        },
        "docker.io/openshift/origin-pod": {
            "docker.io/openshift/origin-pod:v1.3.0": "sha256:35873f68181d0483ee4b2eb004ea5df34fff1595efdd912a9b6e8d1fb6b39cce",
            "docker.io/openshift/origin-pod@sha256:514f8abc7d59b5e3ded61361da76cce9f5e2421db2a45109cfdf3d335aa8327d": "sha256:35873f68181d0483ee4b2eb004ea5df34fff1595efdd912a9b6e8d1fb6b39cce"
        },
        "docker.io/openshift/origin-sti-builder": {
            "docker.io/openshift/origin-sti-builder:v1.3.0": "sha256:1d97be2a77ff476f85bb020a75b6a94f6326ee73d7612886da4801f0363dcad0",
            "docker.io/openshift/origin-sti-builder@sha256:a501d0ccfd7fdf573f781d85caab22eee86b10eb9c7cbc21864a1ac733029b8c": "sha256:1d97be2a77ff476f85bb020a75b6a94f6326ee73d7612886da4801f0363dcad0"
        },
        "docker.io/openshift/ruby-20-centos7": {
            "docker.io/openshift/ruby-20-centos7@sha256:33734ca04d7a7e225b722121c3b47186fbeff69cb97e8fb32898b9fc86a7c443": "sha256:c240a88de524fb0b9f646c56a89e29169c4a8e283a3036cf4aa586f10968d628"
        }
    }
}
[root@openshift-test ~]# docker inspect sha256:97beeb7362a49a0c534be9082babc9b0232a13571d64f17e9db0a62622ee908f
[
    {
        "Id": "sha256:97beeb7362a49a0c534be9082babc9b0232a13571d64f17e9db0a62622ee908f",
        "RepoTags": [
            "172.30.151.66:5000/myproject/ruby-ex:latest"
        ],
        "RepoDigests": [
            "172.30.151.66:5000/myproject/ruby-ex@sha256:172e3b42afa9e3dbe3cadadb0349f232f745f9177143cfa13beef873a324f72c"
        ],
        "Parent": "sha256:c240a88de524fb0b9f646c56a89e29169c4a8e283a3036cf4aa586f10968d628",
        "Comment": "",
        "Created": "2016-09-28T15:01:48.043228372Z",
        "Container": "5fed5af850fac07192ceabb5909e0b3d00bcb424d99d5c4aeccf75e18e271c6f",
        "ContainerConfig": {
            "Hostname": "ruby-ex-1-build",
            "Domainname": "",
            "User": "1001",
            "AttachStdin": false,
            "AttachStdout": true,
            "AttachStderr": false,
            "ExposedPorts": {
                "8080/tcp": {}
            },
            "Tty": false,
            "OpenStdin": true,
            "StdinOnce": true,
            "Env": [
                "OPENSHIFT_BUILD_NAME=ruby-ex-1",
                "OPENSHIFT_BUILD_NAMESPACE=myproject",
                "OPENSHIFT_BUILD_SOURCE=https://github.com/gbraad/ruby-ex",
                "PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "STI_SCRIPTS_URL=image:///usr/libexec/s2i",
                "STI_SCRIPTS_PATH=/usr/libexec/s2i",
                "HOME=/opt/app-root/src",
                "BASH_ENV=/opt/app-root/etc/scl_enable",
                "ENV=/opt/app-root/etc/scl_enable",
                "PROMPT_COMMAND=. /opt/app-root/etc/scl_enable",
                "RUBY_VERSION=2.0"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "tar -C /tmp -xf - \u0026\u0026 /usr/libexec/s2i/assemble"
            ],
            "Image": "openshift/ruby-20-centos7@sha256:33734ca04d7a7e225b722121c3b47186fbeff69cb97e8fb32898b9fc86a7c443",
            "Volumes": null,
            "WorkingDir": "/opt/app-root/src",
            "Entrypoint": [
                "/usr/bin/env"
            ],
            "OnBuild": null,
            "Labels": {
                "build-date": "20160906",
                "io.k8s.description": "Platform for building and running Ruby 2.0 applications",
                "io.k8s.display-name": "myproject/ruby-ex-1:8cbe51fc",
                "io.openshift.build.commit.author": "Michal Fojtik \u003cmi@mifo.sk\u003e",
                "io.openshift.build.commit.date": "Thu Jun 30 10:47:53 2016 +0200",
                "io.openshift.build.commit.id": "f63d076b602441ebd65fd0749c5c58ea4bafaf90",
                "io.openshift.build.commit.message": "Merge pull request #2 from mfojtik/add-puma",
                "io.openshift.build.commit.ref": "master",
                "io.openshift.build.image": "openshift/ruby-20-centos7@sha256:33734ca04d7a7e225b722121c3b47186fbeff69cb97e8fb32898b9fc86a7c443",
                "io.openshift.build.source-location": "https://github.com/gbraad/ruby-ex",
                "io.openshift.builder-base-version": "fa7ba54",
                "io.openshift.builder-version": "bbe87768dbefe4b75674d60fa72cd70b1338d675",
                "io.openshift.expose-services": "8080:http",
                "io.openshift.s2i.scripts-url": "image:///usr/libexec/s2i",
                "io.openshift.tags": "builder,ruby,ruby20",
                "io.s2i.scripts-url": "image:///usr/libexec/s2i",
                "license": "GPLv2",
                "name": "CentOS Base Image",
                "vendor": "CentOS"
            }
        },
        "DockerVersion": "1.10.3",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "1001",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "8080/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "OPENSHIFT_BUILD_NAME=ruby-ex-1",
                "OPENSHIFT_BUILD_NAMESPACE=myproject",
                "OPENSHIFT_BUILD_SOURCE=https://github.com/gbraad/ruby-ex",
                "PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "STI_SCRIPTS_URL=image:///usr/libexec/s2i",
                "STI_SCRIPTS_PATH=/usr/libexec/s2i",
                "HOME=/opt/app-root/src",
                "BASH_ENV=/opt/app-root/etc/scl_enable",
                "ENV=/opt/app-root/etc/scl_enable",
                "PROMPT_COMMAND=. /opt/app-root/etc/scl_enable",
                "RUBY_VERSION=2.0"
            ],
            "Cmd": [
                "/usr/libexec/s2i/run"
            ],
            "Image": "",
            "Volumes": null,
            "WorkingDir": "/opt/app-root/src",
            "Entrypoint": [
                "container-entrypoint"
            ],
            "OnBuild": null,
            "Labels": {
                "build-date": "20160906",
                "io.k8s.description": "Platform for building and running Ruby 2.0 applications",
                "io.k8s.display-name": "myproject/ruby-ex-1:8cbe51fc",
                "io.openshift.build.commit.author": "Michal Fojtik \u003cmi@mifo.sk\u003e",
                "io.openshift.build.commit.date": "Thu Jun 30 10:47:53 2016 +0200",
                "io.openshift.build.commit.id": "f63d076b602441ebd65fd0749c5c58ea4bafaf90",
                "io.openshift.build.commit.message": "Merge pull request #2 from mfojtik/add-puma",
                "io.openshift.build.commit.ref": "master",
                "io.openshift.build.image": "openshift/ruby-20-centos7@sha256:33734ca04d7a7e225b722121c3b47186fbeff69cb97e8fb32898b9fc86a7c443",
                "io.openshift.build.source-location": "https://github.com/gbraad/ruby-ex",
                "io.openshift.builder-base-version": "fa7ba54",
                "io.openshift.builder-version": "bbe87768dbefe4b75674d60fa72cd70b1338d675",
                "io.openshift.expose-services": "8080:http",
                "io.openshift.s2i.scripts-url": "image:///usr/libexec/s2i",
                "io.openshift.tags": "builder,ruby,ruby20",
                "io.s2i.scripts-url": "image:///usr/libexec/s2i",
                "license": "GPLv2",
                "name": "CentOS Base Image",
                "vendor": "CentOS"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 444142460,
        "VirtualSize": 444142460,
        "GraphDriver": {
            "Name": "devicemapper",
            "Data": {
                "DeviceId": "71",
                "DeviceName": "docker-252:1-262198-05f711fc64a60ff6381d516287cb1dffd04c9704a27c6496d01a6f64049656e9",
                "DeviceSize": "10737418240"
            }
        }
    }
]
[root@openshift-test ~]# oc logs bc/ruby-ex
Cloning "https://github.com/gbraad/ruby-ex" ...
        Commit: f63d076b602441ebd65fd0749c5c58ea4bafaf90 (Merge pull request #2 from mfojtik/add-puma)
        Author: Michal Fojtik <mi@mifo.sk>
        Date:   Thu Jun 30 10:47:53 2016 +0200
---> Installing application source ...
---> Building your Ruby application from source ...
---> Running 'bundle install --deployment' ...
Fetching gem metadata from https://rubygems.org/...............
Installing puma (3.4.0)
Installing rack (1.6.4)
Using bundler (1.3.5)
Cannot write a changed lockfile while frozen.
Your bundle is complete!
It was installed into ./bundle
---> Cleaning up unused ruby gems ...
Pushing image 172.30.151.66:5000/myproject/ruby-ex:latest ...
Pushed 0/10 layers, 10% complete
Pushed 1/10 layers, 30% complete
Pushed 2/10 layers, 23% complete
Pushed 3/10 layers, 33% complete
Pushed 4/10 layers, 43% complete
Pushed 5/10 layers, 52% complete
Pushed 6/10 layers, 61% complete
Pushed 7/10 layers, 71% complete
Pushed 7/10 layers, 86% complete
Pushed 8/10 layers, 91% complete
Pushed 9/10 layers, 100% complete
Pushed 10/10 layers, 100% complete
Push successful
[root@openshift-test ~]# oc logs dc/ruby-ex
--> Scaling ruby-ex-1 to 1
--> Waiting up to 10m0s for pods in deployment ruby-ex-1 to become ready
error: update acceptor rejected ruby-ex-1: pods for deployment "ruby-ex-1" took longer than 600 seconds to become ready
[root@openshift-test ~]# docker pull 172.30.151.66:5000/myproject/ruby-ex:latest
Trying to pull repository 172.30.151.66:5000/myproject/ruby-ex ... 
Pulling repository 172.30.151.66:5000/myproject/ruby-ex
Error: image myproject/ruby-ex not found
```