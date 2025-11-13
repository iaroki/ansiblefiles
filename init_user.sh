#!/usr/bin/env bash

python3 -m venv venv
source venv/bin/activate
pip install ansible
ansible-playbook debian.yaml --ask-become-pass --diff
