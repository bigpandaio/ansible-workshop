## Ok, Installed Nginx like a boss, now what?

#### Could we do that better?

If we'd run our playbook on both Ubuntu servers and Centos, It'd fail miserably.

Ideally, we'd want to do some kind of conditional installation according to the distribution we're currently running on.

For each task in our playbook, we can add a `when` directive:

```
...
  tasks:
    - name: Install nginx
      apt:  name=nginx state=present
      when: something is not "sababa"
```

And the content of the `when` expression is Pythonic!

Let's wait for the excitement of the Pythonistas to relax a bit, then let's continue.

#### All of this is awesome, but how'll we know what distribution we're on?

NO. You there in the 3rd row. NO. We'll NOT `cat /etc/lsb_release` or use `uname -dASDASE`.

![UNAME. NO](https://github.com/bigpandaio/ansible-workshop/blob/noob-workshop-docker/memez/uname_no.jpg?raw=true)

Ansible exposes about a trizilion magic variables that holds information about the running ansible process, the target host and MOAR™.

Let's use one of those magic variables in our `when` directive called `ansible_os_family`.

![Magic](https://github.com/bigpandaio/ansible-workshop/blob/noob-workshop-docker/memez/magic.gif?raw=true)

You can actually get the (very long) list of variables available by running:

```
ansible -i ansible ansible-workshop -m setup
```

#### Ok, enough with the MEMEz, let's actually use that

```
...
  tasks:
    - name: Install nginx on Ubuntu/Debian
      apt:  name=nginx state=present
      when: ansible_os_family == "Debian"

    - name: Install nginx on RedHat/CentOS
      yum:  name=nginx state=present
      when: ansible_os_family == "RedHat"
```

#### Wait a sec, I noticed something strange here

The Ansible output now had a skipped task:

```
skipping: [ansible-workshop]
```

That's the *Install nginx on RedHat/CentOS* task that is not running because the `when` directive is false.

AHHH.

#### Still though, We've just installed Nginx, haven't really deployed anything have we now?

Ok Ok,

KEEP CALM

AND

MOVE TO

[THE NEXT STEP](./4_Nginx-now-for-content.md)
