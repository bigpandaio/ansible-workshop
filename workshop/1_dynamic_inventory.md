## In the previous workshop, we had a static host list

That sucks, let's not do that again.

### This time we'll use a dynamic host script

If the hosts file we tell Ansible to use is executable, Ansible will execute it to get a JSON list of hosts, host groups, variables and connection details.

A typical dynamic host provider is AWS, which is simply a python executable and a config file.

We're going to use a dynamic host provider from the Ansible contrib [made for vagrant](https://github.com/ansible/ansible/raw/devel/contrib/inventory/vagrant.py
).

We've made some small changes to the script, to add host group support.

### Let's try it out

Do a `vagrant up` if you haven't already.

Run:

```bash
./dev/hosts --list
```

You'll now see a JSON list of all the hosts in the [Vagrantfile](../Vagrantfile) (two hosts for now, *web* and *app-1*).

#### We can now test it using Ansible ad-hoc commands

```bash
ansible tag_role_web -a 'whoami'
ansible tag_role_api -a 'whoami'
```

### tag_role_WAT?

Where did that `tag_role_` come from?

In [our static](../dev/static) file we matched group names to tag roles, a typical convention used across providers.

```
[web]
[app]

[tag_role_web:children]
web

[tag_role_app:children]
app
```

### Ok Ok, so Ansible now knows our host, what now?

Let's start creating playbooks per host type, jump to [step 2](./2_playbooks_per_host.md)
