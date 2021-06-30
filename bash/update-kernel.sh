#!/bin/bash
yum -y upgrade &&
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org &&
# rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm;
rpm -Uvh https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm;
yum --disablerepo=\* --enablerepo=elrepo-kernel repolist &&
yum --disablerepo=\* --enablerepo=elrepo-kernel install  kernel-ml.x86_64  -y &&
yum remove kernel-tools-libs.x86_64 kernel-tools.x86_64  -y &&
yum --disablerepo=\* --enablerepo=elrepo-kernel install kernel-ml-tools kernel-ml-devel kernel-ml-headers -y &&
sudo awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg;
sudo grub2-set-default 0 && 
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
