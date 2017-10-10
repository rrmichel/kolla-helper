#!/bin/bash

[[ -d config ]] && CONFIGVOL="-v $PWD/config:/config"
if docker images kolla-helper | grep kolla-helper  > /dev/null; then
	docker run --rm --net host $CONFIGVOL -ti kolla-helper $@
else
	echo "Missing image kolla-helper!"
fi
