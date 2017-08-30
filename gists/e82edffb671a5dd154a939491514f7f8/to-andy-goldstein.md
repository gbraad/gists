There are two entries as you can see, due to running `oc cluster up` and `oc cluster down` on this node.

```json
{
    "Repositories": {
        "172.30.211.23:5000/myproject/ruby-ex": {
            "172.30.211.23:5000/myproject/ruby-ex:latest": "sha256:778dd7031593c6c1161159b9433f8865c56f827f1a9c0411d695416373b35833",
            "172.30.211.23:5000/myproject/ruby-ex@sha256:050a263ccf9db73bf688f22f7fdcb690d588dbd1cc8c5a7f50b461ef64dcc88d": "sha256:778dd7031593c6c1161159b9433f8865c56f827f1a9c0411d695416373b35833"
        },
        "172.30.224.59:5000/myproject/ruby-ex": {
            "172.30.224.59:5000/myproject/ruby-ex:latest": "sha256:248c3b3901fa1e5eac54ecbf034035a168cd573f4e6529acfd34bd784dd92c79",
            "172.30.224.59:5000/myproject/ruby-ex@sha256:989ca05c21799a4de6f17bff5548dbcdb50b1064cc1c4d4b7450bcf2604ee919": "sha256:248c3b3901fa1e5eac54ecbf034035a168cd573f4e6529acfd34bd784dd92c79"
        },
        "docker.io/busybox": {
            "docker.io/busybox:latest": "sha256:2b8fd9751c4c0f5dd266fcae00707e67a2545ef34f9a29354585f93dac906749",
            "docker.io/busybox@sha256:a59906e33509d14c036c8678d687bd4eec81ed7c4b8ce907b888c607f6a1e0e6": "sha256:2b8fd9751c4c0f5dd266fcae00707e67a2545ef34f9a29354585f93dac906749"
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
```

```bash
$ docker inspect sha256:778dd7031593c6c1161159b9433f8865c56f827f1a9c0411d695416373b35833
[
    {
        "Id": "sha256:778dd7031593c6c1161159b9433f8865c56f827f1a9c0411d695416373b35833",
        "RepoTags": [
            "172.30.211.23:5000/myproject/ruby-ex:latest"
        ],
        "RepoDigests": [
            "172.30.211.23:5000/myproject/ruby-ex@sha256:050a263ccf9db73bf688f22f7fdcb690d588dbd1cc8c5a7f50b461ef64dcc88d"
        ],
        "Parent": "sha256:c240a88de524fb0b9f646c56a89e29169c4a8e283a3036cf4aa586f10968d628",
        "Comment": "",
        "Created": "2016-09-28T01:59:08.184618395Z",
        "Container": "0549ec145954ad7ec4fc7c1a193b52195ff81330a8efa1494d0220a4b23aaf57",
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
                "io.k8s.display-name": "myproject/ruby-ex-1:3598363d",
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
                "io.k8s.display-name": "myproject/ruby-ex-1:3598363d",
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
        "Size": 444142458,
        "VirtualSize": 444142458,
        "GraphDriver": {
            "Name": "devicemapper",
            "Data": {
                "DeviceId": "74",
                "DeviceName": "docker-252:1-262212-0de586d4bec031dfa482dafa32791bd0c014500e03e61edc8a719ba114301ad0",
                "DeviceSize": "10737418240"
            }
        }
    }
]
[fedora@openshift-controller ~]$ docker inspect sha256:248c3b3901fa1e5eac54ecbf034035a168cd573f4e6529acfd34bd784dd92c79
[
    {
        "Id": "sha256:248c3b3901fa1e5eac54ecbf034035a168cd573f4e6529acfd34bd784dd92c79",
        "RepoTags": [
            "172.30.224.59:5000/myproject/ruby-ex:latest"
        ],
        "RepoDigests": [
            "172.30.224.59:5000/myproject/ruby-ex@sha256:989ca05c21799a4de6f17bff5548dbcdb50b1064cc1c4d4b7450bcf2604ee919"
        ],
        "Parent": "sha256:c240a88de524fb0b9f646c56a89e29169c4a8e283a3036cf4aa586f10968d628",
        "Comment": "",
        "Created": "2016-09-28T09:11:41.416596696Z",
        "Container": "37b233cf6bceb417f0429db96bc0690ebc2fda8bb61a9c4e6f4342ad98688a6e",
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
                "io.k8s.display-name": "myproject/ruby-ex-1:1366297c",
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
                "io.k8s.display-name": "myproject/ruby-ex-1:1366297c",
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
                "DeviceId": "121",
                "DeviceName": "docker-252:1-262212-78b7a72f5885d151accc3e2f18c84bbbc6a6b236fc8c0e74743ad556c02d49bf",
                "DeviceSize": "10737418240"
            }
        }
    }
]
```