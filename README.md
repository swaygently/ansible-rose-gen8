# Ansible Role: HP Gen8

初始化安装CentOS的HP MicroServer Gen8，安装mcp、初始化虚拟机。其中虚拟化了一台OPNsense作为软路由，其他的虚拟机连接到软路由的LAN口。


## Requirements

* 在Gen8上安装好CentOS。
* 配置好网络连接和域名解析（/etc/resolv.conf）,会使用yum源来安装软件。
* 将虚拟机需要的镜像拷贝到指定目录，具体位置可以根据role的默认配置（default/main.yml）来查看。


## Example

    ansible-galaxy install -r requirements.yml

*Inside `requirements.yml`*:

    - src: https://github.com/swaygenlty/ansible-role-gen8
      name: swaygently.gen8

Playbook:

    - hosts: gen8_server
      become: yes
      roles:
        - { role: swaygently.gen8 }
