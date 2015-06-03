## Ok, Installed Nginx like a boss, now what?

#### Could we do that better?

If we'd run our playbook on both Ubuntu servers and Centos, It'd fail miserably.

Ideally, we'd want to do some kind of conditional installation according to the distribution we're currently running on.

For each task in our playbook, we can add a `when` directive:

```
...
  tasks:
    - name: install nginx
      apt:  name=nginx state=present
      sudo: yes
      when: something is not "sababa"
```

And the content of the `when` expression is pythonic!

Let's wait for the excitement of the Pythonistas to relax a bit, then let's continue.

#### All of this is awesome, but how'll we know what distribution we're on?

NO. You there in the 3rd row. NO. We'll NOT `cat /etc/lsb_release` or use `uname -dASDASE`.

[INSERT NO RAGE MEME HERE]

Ansible exposes about a trizilion magic variables that holds information about the running ansible process, the target host and MOAR.

Let's use one of those magic variables in our `when` directive called `ansible_os_family`.

[INSERT MAGIC MEME HERE]

#### Ok, enough with the MEMEz, let's actually use that

```
...
  tasks:
    - name: install nginx
      apt:  name=nginx state=present
      sudo: yes
      when: ansible_os_family == "Debian"

    - name: install nginx
      yum:  name=nginx state=present
      sudo: yes
      when: ansible_os_family == "RedHat"
```

#### Wait a sec, I noticied something strange here

The Ansible output now had a skipped task:

```
skipping: [ansible-workshop-vagrant]
```

That's the *Install Nginx* task that is not running because the `when` directive is false.

AHHH.
