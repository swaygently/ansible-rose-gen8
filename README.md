# Ansible Role: HP Gen8

Installs and configures SPP/MCP for RHEL/CentOS on HP MicroServer Gen8.


## Example

    ansible-galaxy install -r requirements.yml

*Inside `requirements.yml`*:

    - src: https://github.com/swaygenlty/ansible-role-gen8
      name: swaygently.gen8

Playbook:

    - hosts: server
      become: yes
      roles:
        - { role: swaygently.gen8 }
