## Ok, Ansible can connect to docker, what now?

#### Running Ansible Ad-Hoc commands

Now we'll use Ansible to run ad hoc commands on our instance

Examples

```
ansible ansible-workshop -m ping
ansible ansible-workshop -a '/bin/echo "Hello there!"'
```

#### Good for:

- Quick commands - also across multiple hosts
- Querying states / services

#### Not that good for:

- Reoccurring events (deployments / configuration)
- Needs to be entered manually (THE HORROR!!1)

#### But then, that's not very *AUTOMATED*??

True dat, see [the next step](./1_Why-Hello-There-Playbooks.md)
