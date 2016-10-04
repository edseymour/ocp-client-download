FROM registry.access.redhat.com/rhscl/php-56-rhel7:latest

USER root
RUN yum install -y --enablerepo=rhel-7-server-ose-3.2-rpms atomic-openshift-clients-redistributable tar zip && yum clean all

## /usr/share/atomic-openshift/linux/oc
## /usr/share/atomic-openshift/macosx/oc
## /usr/share/atomic-openshift/windows/oc.exe

WORKDIR /opt/openshift/src

## Create downloads
RUN tar -zcf ./openshift-client-linux.tar.gz -C /usr/share/atomic-openshift/linux oc
RUN tar -zcf ./openshift-client-macosx.tar.gz -C /usr/share/atomic-openshift/macosx oc
RUN zip openshift-client-windows.zip -j -b /usr/share/atomic-openshift/windows /usr/share/atomic-openshift/windows/oc.exe
RUN chown 1001:1001 -R *

RUN rm -f Dockerfile && rm -f index.php && rm -f README.md

USER 1001
