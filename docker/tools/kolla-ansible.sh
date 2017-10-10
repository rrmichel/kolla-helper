#!/bin/bash

/kolla-ansible/tools/kolla-ansible -i $CONFIGDIR/hosts --configdir $CONFIGDIR --passwords $PASSWDFILE $@
