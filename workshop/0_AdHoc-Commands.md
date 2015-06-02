## Ok, Ansible can connect to vagrant, what now?

### Running Ansible Ad-Hoc commands

Examples

```
ansible ansible-workshop-vagrant -m ping
```

```
ansible ansible-workshop-vagrant -m setup
```

#### Good for:

- Quick commands - also across multiple hosts
- Querying states / services

#### Not that good for:

- Reoccoring events (deployments / configuration)
- Needs to be entered manually (THE HORROR!!1)
