Install C9 on CentOS as SSH remote workspace
============================================

To setup a SSH remote workspace for C9 on CentOS do the following on the host:

```bash
yum install git
git clone https://github.com/c9/core.git /opt/c9sdk
yum groupinstall "Development Tools"
yum install glibc-static
yum install tmux # or let it build a version
cd /opt/c9sdk/scripts
./install-sdk.sh
```

Go to http://c9.io/new and select SSH workspace.
Add the key to `~/.ssh/authorized_keys` for the user you allow access.
As node executable refer to `~/.c9/node/bin/node`

Note:
I previously used the RPM packaged versions of node and npm, but it was not always succeeding. This might have been related to the network connection. This following these instructions the environment is immediately usable without having to do the install from the C9 workspace.