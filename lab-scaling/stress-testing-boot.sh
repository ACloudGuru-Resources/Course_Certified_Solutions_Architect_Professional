#!/bin/bash
# USAGE: Place in in the User Data section (under Advanced) when launching an EC2 instance
# DESCRIPTION: After updating from the repo, installs stress, a tool used to create various system load for testing purposes.
yum update -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -P /tmp
yum install -y /tmp/epel-release-latest-7.noarch.rpm
yum install stress -y
/usr/bin/stress --cpu 8 --timeout 10m