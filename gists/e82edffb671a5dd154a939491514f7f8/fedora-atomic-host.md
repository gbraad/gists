After `rpm-ostree upgrade; reboot`:

```
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ export PATH=$PATH:$PWD
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ oc cluster up
-- Checking OpenShift client ... OK
-- Checking Docker client ... OK
-- Checking Docker version ... OK
-- Checking for existing OpenShift container ... 
   Deleted existing OpenShift container
-- Checking for openshift/origin:v1.3.0 image ... OK
-- Checking Docker daemon configuration ... OK
-- Checking for available ports ... OK
-- Checking type of volume mount ... 
   Using nsenter mounter for OpenShift volumes
-- Creating host directories ... OK
-- Finding server IP ... 
   Using 10.3.0.56 as the server IP
-- Starting OpenShift container ... 
   Creating initial OpenShift configuration
   Starting OpenShift using container 'origin'
   Waiting for API server to start listening
   OpenShift server started
-- Installing registry ... OK
-- Installing router ... OK
-- Importing image streams ... OK
-- Importing templates ... OK
-- Login to server ... OK
-- Creating initial project "myproject" ... OK
-- Server Information ... 
   OpenShift server started.
   The server is accessible via web console at:
       https://10.3.0.56:8443

   You are logged in as:
       User:     developer
       Password: developer

   To login as administrator:
       oc login -u system:admin

[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ oc new-app openshift/ruby-20-centos7~https://github.com/gbraad/ruby-ex
warning: Cannot find git. Ensure that it is installed and in your path. Git is required to work with git repositories.
--> Found Docker image 7f4e7f1 (7 days old) from Docker Hub for "openshift/ruby-20-centos7"

    Ruby 2.0 
    -------- 
    Platform for building and running Ruby 2.0 applications

    Tags: builder, ruby, ruby20

    * An image stream will be created as "ruby-20-centos7:latest" that will track the source image
    * A source build using source code from https://github.com/gbraad/ruby-ex will be created
      * The resulting image will be pushed to image stream "ruby-ex:latest"
      * Every time "ruby-20-centos7:latest" changes a new build will be triggered
    * This image will be deployed in deployment config "ruby-ex"
    * Port 8080/tcp will be load balanced by service "ruby-ex"
      * Other containers can access this service through the hostname "ruby-ex"

--> Creating resources with label app=ruby-ex ...
    imagestream "ruby-20-centos7" created
    imagestream "ruby-ex" created
    buildconfig "ruby-ex" created
    deploymentconfig "ruby-ex" created
    service "ruby-ex" created
--> Success
    Build scheduled, use 'oc logs -f bc/ruby-ex' to track its progress.
    Run 'oc status' to view your app.
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ oc get pods
NAME              READY     STATUS    RESTARTS   AGE
ruby-ex-1-build   1/1       Running   0          12s
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ oc get pods
NAME              READY     STATUS    RESTARTS   AGE
ruby-ex-1-build   1/1       Running   0          49s
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ oc get pods
NAME               READY     STATUS             RESTARTS   AGE
ruby-ex-1-build    0/1       Completed          0          6m
ruby-ex-1-deploy   1/1       Running            0          4m
ruby-ex-1-xawpm    0/1       ImagePullBackOff   0          4m
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ oc get events
LASTSEEN   FIRSTSEEN   COUNT     NAME              KIND      SUBOBJECT                    TYPE      REASON       SOURCE                 MESSAGE
6m         6m          1         ruby-ex-1-build   Pod                                    Normal    Scheduled    {default-scheduler }   Successfully assigned ruby-ex-1-build to 10.3.0.56
6m         6m          1         ruby-ex-1-build   Pod       spec.containers{sti-build}   Normal    Pulled       {kubelet 10.3.0.56}    Container image "openshift/origin-sti-builder:v1.3.0" already present on machine
6m         6m          1         ruby-ex-1-build   Pod       spec.containers{sti-build}   Normal    Created      {kubelet 10.3.0.56}    Created container with docker id 7e63b0bae93e
6m         6m          1         ruby-ex-1-build   Pod       spec.containers{sti-build}   Normal    Started      {kubelet 10.3.0.56}    Started container with docker id 7e63b0bae93e
5m         5m          1         ruby-ex-1-build   Pod       spec.containers{sti-build}   Normal    Killing      {kubelet 10.3.0.56}    Killing container with docker id 7e63b0bae93e: Need to kill pod.
5m         5m          1         ruby-ex-1-build   Pod                                    Warning   FailedSync   {kubelet 10.3.0.56}    Error syncing pod, skipping: failed to "KillContainer" for "POD" with KillContainerError: "Error response from daemon: Cannot stop container f2044b63548c5c7e5bb39947b009b02c08502465c422c01404db3051bb55487c: active container for f2044b63548c5c7e5bb39947b009b02c08502465c422c01404db3051bb55487c does not exist"

5m        5m        1         ruby-ex-1-deploy   Pod                                     Normal    Scheduled    {default-scheduler }   Successfully assigned ruby-ex-1-deploy to 10.3.0.56
5m        5m        1         ruby-ex-1-deploy   Pod       spec.containers{deployment}   Normal    Pulled       {kubelet 10.3.0.56}    Container image "openshift/origin-deployer:v1.3.0" already present on machine
5m        5m        1         ruby-ex-1-deploy   Pod       spec.containers{deployment}   Normal    Created      {kubelet 10.3.0.56}    Created container with docker id ed842c1e9448
5m        5m        1         ruby-ex-1-deploy   Pod       spec.containers{deployment}   Normal    Started      {kubelet 10.3.0.56}    Started container with docker id ed842c1e9448
4m        4m        1         ruby-ex-1-xawpm    Pod                                     Normal    Scheduled    {default-scheduler }   Successfully assigned ruby-ex-1-xawpm to 10.3.0.56
2m        4m        5         ruby-ex-1-xawpm    Pod       spec.containers{ruby-ex}      Normal    Pulling      {kubelet 10.3.0.56}    pulling image "172.30.6.110:5000/myproject/ruby-ex@sha256:f9a9bfbd6e64334d81d5bd97760385427ec22a97828b602487e233c1692b9baa"
2m        4m        5         ruby-ex-1-xawpm    Pod       spec.containers{ruby-ex}      Warning   Failed       {kubelet 10.3.0.56}    Failed to pull image "172.30.6.110:5000/myproject/ruby-ex@sha256:f9a9bfbd6e64334d81d5bd97760385427ec22a97828b602487e233c1692b9baa": Cannot overwrite digest sha256:f9a9bfbd6e64334d81d5bd97760385427ec22a97828b602487e233c1692b9baa
2m        4m        5         ruby-ex-1-xawpm    Pod                                     Warning   FailedSync   {kubelet 10.3.0.56}    Error syncing pod, skipping: failed to "StartContainer" for "ruby-ex" with ErrImagePull: "Cannot overwrite digest sha256:f9a9bfbd6e64334d81d5bd97760385427ec22a97828b602487e233c1692b9baa"

14s       4m        18        ruby-ex-1-xawpm   Pod       spec.containers{ruby-ex}   Normal    BackOff      {kubelet 10.3.0.56}   Back-off pulling image "172.30.6.110:5000/myproject/ruby-ex@sha256:f9a9bfbd6e64334d81d5bd97760385427ec22a97828b602487e233c1692b9baa"
14s       4m        18        ruby-ex-1-xawpm   Pod                                  Warning   FailedSync   {kubelet 10.3.0.56}   Error syncing pod, skipping: failed to "StartContainer" for "ruby-ex" with ImagePullBackOff: "Back-off pulling image \"172.30.6.110:5000/myproject/ruby-ex@sha256:f9a9bfbd6e64334d81d5bd97760385427ec22a97828b602487e233c1692b9baa\""

4m        4m        1         ruby-ex-1   ReplicationController             Normal    SuccessfulCreate    {replication-controller }        Created pod: ruby-ex-1-xawpm
5m        5m        1         ruby-ex     DeploymentConfig                  Normal    DeploymentCreated   {deploymentconfig-controller }   Created new deployment "ruby-ex-1" for version 1
[fedora@atomic openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit]$ docker version
Client:
 Version:         1.10.3
 API version:     1.22
 Package version: docker-1.10.3-52.git8b7fa4a.fc24.x86_64
 Go version:      go1.6.3
 Git commit:      8b7fa4a/1.10.3
 Built:           
 OS/Arch:         linux/amd64

Server:
 Version:         1.10.3
 API version:     1.22
 Package version: docker-1.10.3-52.git8b7fa4a.fc24.x86_64
 Go version:      go1.6.3
 Git commit:      8b7fa4a/1.10.3
 Built:           
 OS/Arch:         linux/amd64
```