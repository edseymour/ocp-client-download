FROM registry.access.redhat.com/rhscl/php-56-rhel7:latest

USER root
RUN yum install -y atomic-openshift-clients-redistributable tar zip && yum clean all && rpm -ql atomic-openshift-clients-redistributable

## /usr/share/atomic-openshift/linux/oc
## /usr/share/atomic-openshift/macosx/oc
## /usr/share/atomic-openshift/windows/oc.exe

WORKDIR /opt/openshift/src

## Create downloads
RUN tar -zcf ./openshift-client-linux.tar.gz -C /usr/share/atomic-openshift/linux oc
RUN tar -zcf ./openshift-client-macosx.tar.gz -C /usr/share/atomic-openshift/maxosx oc
RUN zip -j -b /usr/share/atomic-openshift/windows/oc.exe ./openshift-client-windows.zip

ADD index.php

USER 1001
