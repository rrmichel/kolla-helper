FROM ubuntu:16.04
MAINTAINER Michel Rode <rode@b1-systems.de>

RUN apt update && apt upgrade -y

RUN apt install -y git python-pip

RUN pip install --upgrade pip

RUN git clone https://github.com/openstack/kolla-ansible.git /kolla-ansible/

RUN pip install ansible==2.3.0.0 && pip install -r /kolla-ansible/requirements.txt

ADD config /config/
ADD tools/* /usr/local/sbin/

ENV CONFIGDIR=/config/ PASSWDFILE=/config/passwords.yml

WORKDIR /config/

ENTRYPOINT ["/usr/local/sbin/kolla-ansible.sh"]
CMD ["--help"]
