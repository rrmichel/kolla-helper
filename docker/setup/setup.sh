#!/bin/bash

pip install -r /setup/requirements.txt

cd /kolla-ansible
patch -p1 < /setup/*.patch
