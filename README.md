
#Quickstart

*Step 1*

    git clone http://github.com/rmichel/kolla-helper
    cd kolla-helper

*Step 2*

    docker build docker/ -t kolla-helper:latest
or
	build-helper.sh

*Step 3*

	./kolla-ansible bootstrap-server|prechecks|deploy
