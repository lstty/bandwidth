#!/bin/bash

if [ -z $1 ]; then
	echo "用法： bash entry.sh 1"
	echo "1 为进程数量，单个进程约100M带宽"
	exit
fi

cat /proc/net/dev| grep ppp | awk '{print $1}' | sed 's/://g' > nic.txt

url=(
"https://mirrors.cloud.tencent.com/centos/8.5.2111/isos/x86_64/CentOS-8.5.2111-x86_64-dvd1.iso"
"https://mirrors.cloud.tencent.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Everything-2207-02.iso"
"https://mirrors.cloud.tencent.com/tlinux/2.4/iso/TencentOS-Server-2.4-TK4-x86_64-everything-2209.3-1.iso"
"https://mirrors.cloud.tencent.com/tlinux/3.1/iso/x86_64/TencentOS-Server-3.1-TK4-x86_64-cloud-2205.iso"
"https://mirrors.cloud.tencent.com/opensuse/factory/iso/openSUSE-MicroOS-DVD-x86_64-Current.iso"
"https://mirrors.cloud.tencent.com/ubuntu-releases/22.10/ubuntu-22.10-desktop-amd64.iso"
"https://mirrors.aliyun.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Everything-2009.iso"
"https://mirrors.aliyun.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Everything-2207-02.iso"
"https://mirrors.aliyun.com/centos/8.5.2111/isos/x86_64/CentOS-8.5.2111-x86_64-dvd1.iso"
"https://mirrors.aliyun.com/oldubuntu-releases/releases/22.04/ubuntu-22.04-desktop-amd64.iso"
"https://mirrors.aliyun.com/oldubuntu-releases/releases/21.04/ubuntu-21.04-beta-desktop-amd64.iso"
"https://mirrors.aliyun.com/oldubuntu-releases/releases/18.04.1/ubuntu-18.04.3-desktop-amd64.iso"
"https://mirrors.aliyun.com/oldubuntu-releases/releases/19.10/ubuntu-19.10-desktop-amd64.iso"
"https://mirrors.aliyun.com/oldubuntu-releases/releases/20.04.2/ubuntu-20.04-beta-desktop-amd64.iso"
"https://mirrors.aliyun.com/rockylinux/9.0/isos/aarch64/Rocky-9.0-20220808.0-aarch64-dvd.iso"
"https://mirrors.aliyun.com/rockylinux/9.0/isos/ppc64le/Rocky-9.0-20220808.0-ppc64le-dvd.iso"
"https://mirrors.aliyun.com/rockylinux/9.0/isos/ppc64le/Rocky-ppc64le-dvd.iso"
"https://mirrors.aliyun.com/opensuse/distribution/leap/15.5/iso/openSUSE-Leap-15.5-NET-s390x-Current.iso"
"https://mirrors.aliyun.com/opensuse/distribution/leap/15.5/iso/openSUSE-Leap-15.5-NET-s390x-Media.iso"
"https://mirrors.aliyun.com/opensuse/distribution/leap/15.5/iso/openSUSE-Leap-15.5-NET-x86_64-Current.iso"
)

index=0

while read line || [[ -n ${line} ]]
do
	echo "网卡 $line 带宽限制 $1 * 100"
	echo "nohup bash bw.sh $1 $line ${url[$index]} > /dev/null 2>&1 &"
	index=`expr $index + 1`
done < nic.txt