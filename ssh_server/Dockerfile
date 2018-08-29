FROM cern/cc7-base
RUN yum install -y iproute openssh openssh-server openssh-clients openssl-libs
RUN yum install -y net-tools

ENV container docker

RUN mkdir /root/.ssh && chmod 700 /root/.ssh
COPY authorized-keys /root/.ssh/authorized-keys
COPY entrypoint.sh /root
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT /root/entrypoint.sh
