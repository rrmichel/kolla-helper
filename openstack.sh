#!/usr/bin/env bash

docker run --rm --net host --entrypoint openstack -ti kolla-helper --os-cloud admin $@
