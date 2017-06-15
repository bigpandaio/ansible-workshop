## In the previous workshop, we had no idea how the hosts were magically working.

That sucks, let's get smart shall we?

### This time we'll learn what we used - A dynamic hosts inventory (for docker)

If the hosts file we tell Ansible to use is executable, Ansible will execute it to get a JSON list of hosts, host groups, variables and connection details.

A typical dynamic host provider is AWS, which is simply a python executable and a config file.

We're going to use a dynamic host provider from the Ansible contrib [made for docker](https://github.com/ansible/ansible/raw/devel/contrib/inventory/docker.py), with a small addition that adds groups according to docker labels.

### Let's try it out

Run:

```sh
./dev/hosts --list --pretty
#optionally, pipe to jq
./dev/hosts --list | jq '.label_workshop_apprentice'
#jq == EPICNESS
```

**NOTE:**  We're piping to `jq`, a [json cli](https://stedolan.github.io/jq) that rocks the llamas a55.

You'll now see a JSON list of all the docker containers we set up in the bootstrap phase (two containers for now, **ansible-workshop-web** and **ansible-workshop-app-1**).

In addition, they're also grouped, the relevant groups for use are `label_role_web` and `label_role_app`.

#### We can now test it using Ansible ad-hoc commands

```sh
ansible web -a 'hostname'
ansible app -a 'hostname'
```

### web WAT?

Where did that `web|app` come from?

In [our static](../dev/static) file we matched group names to roles, a typical convention used across providers.

```
...
[label_role_app]
[label_role_web]

[web:children]
label_role_web

[app:children]
label_role_app

```

This funky syntax is a bit like configuration files.

The `[name]` syntax means group names.

Using `[name:children]` means that all groups following are children of that group.

### Ok Ok, so Ansible now knows our hosts, what now?

Let's start creating playbooks per host type, jump to [step 2](./2_playbooks_per_host.md)
