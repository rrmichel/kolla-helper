#!/usr/bin/env bash

function run {
	openstack --os-cloud $CLOUDNAME $@
}

CLOUDNAME=admin

run project create --or-show testbed
run role add --user admin --project testbed admin
run quota set --ram 102400 --instances 100 --cores 100 --ports 200 --volumes 200 testbed

run network create --provider-network-type flat --provider-physical-network physnet1 --no-share --external cloud-public
run subnet create --subnet-range 192.168.126.0/24 --gateway 192.168.126.1 --dns-nameserver 192.168.126.1 --network cloud-public cloud-public-subnet

run router create upstream
run router set --external-gateway cloud-public upstream
run router add subnet upstream subnet-testing

CLOUDNAME=testbed

run keypair create keypair-testing

run flavor create --ram 512 --disk 2 --vcpus 1 --public m1.nano

curl https://download.cirros-cloud.net/0.3.5/cirros-0.3.5-x86_64-disk.img > /tmp/cirros-0.3.5-x86_64-disk.img

run image create --file /tmp/cirros-0.3.5-x86_64-disk.img cirros

run network create net-testing
run subnet create --network net-testing --subnet-range 172.16.1.0/24 subnet-testing

run server create --key-name keypair-testing --flavor m1.nano --image cirros --network net-testing server-testing
