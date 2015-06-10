## Ok, so we like totalliz deployed our amazing app. We're Ansible Ninjas++

#### Let's face it though, most deployments are more than just static files...

Usually, we'll need to prepare our targent environment with needed packages.

So if we'll think a bit, we'd use the `apt` or `yum` module as we installed Nginx.

But that wouldn't be much DRY if we have tasks for each package we need.

Ansible helps us here, by giving us the option of doing loops using the `with_item` directive:

```
...
  tasks:
    - name: Install ALL THE PACKAGEz on Ubuntu/Debian
      apt:  name={{ item }} state=present
      sudo: yes
      when: ansible_os_family == "Debian"
      with_items:
        - nginx
        - cowsay

    - name: Install ALL THE PACKAGEZ on RedHat/CentOs
      yum:  name={{ item }} state=present
      sudo: yes
      when: ansible_os_family == "RedHat"
      with_items:
        - nginx
        - cowsay
```

We can even DRY that up even more by defining the packages as a local variable:

```
...
  vars:
    packages_to_install:
      - nginx
      - cowsay
  tasks:
    - name: install ALL THE PACKAGES
      apt:  name={{ item }} state=present
      sudo: yes
      when: ansible_os_family == "Debian"
      with_items: packages_to_install

    - name: install nginx
      yum:  name={{ item }} state=present
      sudo: yes
      when: ansible_os_family == "RedHat"
      with_items: packages_to_install
```


