FROM registry.access.redhat.com/rhscl/php-56-rhel7:latest

USER root
RUN yum install -y --enablerepo=rhel-7-server-ose-3.2-rpms atomic-openshift-clients-redistributable tar zip && yum clean all

## /usr/share/atomic-openshift/linux/oc
## /usr/share/atomic-openshift/macosx/oc
## /usr/share/atomic-openshift/windows/oc.exe

## Create downloads
RUN tar -zcf /opt/openshift/src/openshift-client-linux.tar.gz -C /usr/share/atomic-openshift/linux oc
RUN tar -zcf /opt/openshift/src/openshift-client-macosx.tar.gz -C /usr/share/atomic-openshift/macosx oc
RUN zip /opt/openshift/src/openshift-client-windows.zip -j -b /usr/share/atomic-openshift/windows /usr/share/atomic-openshift/windows/oc.exe

USER 1001
