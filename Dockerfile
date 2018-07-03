FROM registry.access.redhat.com/rhscl/httpd-24-rhel7:latest

USER root
RUN yum install -y --enablerepo=rhel-7-server-ose-3.9-rpms atomic-openshift-clients-redistributable tar zip && yum clean all

## /usr/share/atomic-openshift/linux/oc
## /usr/share/atomic-openshift/macosx/oc
## /usr/share/atomic-openshift/windows/oc.exe

## Create downloads
RUN tar -zcf /var/www/openshift-client-linux.tar.gz -C /usr/share/atomic-openshift/linux oc && \
    tar -zcf /var/www/openshift-client-macosx.tar.gz -C /usr/share/atomic-openshift/macosx oc && \
    zip /var/www/openshift-client-windows.zip -j -b /usr/share/atomic-openshift/windows /usr/share/atomic-openshift/windows/oc.exe

ADD index.html /var/www/index.html

RUN chown -R 1001:0 /var/www && chmod -R 644 /var/www/*

USER 1001
CMD /usr/libexec/s2i/run
