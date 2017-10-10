#!/bin/bash

if docker images kolla-helper | grep kolla-helper  > /dev/null; then
	docker run --rm --net host -ti kolla-helper $@
else
	echo "Missing image kolla-helper!"
fi
