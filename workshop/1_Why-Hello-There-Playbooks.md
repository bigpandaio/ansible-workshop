## Ok, AdHoc might come in handy, but I can't work like that!

### Say Hello To My Little Friend: "Playbooks"

Playbooks are YAML files that declaratively express tasks to run on a set of hosts

A YAML file allows a simple human readable syntax, is easy to read and write, but it has some [GOTCHAS](http://docs.ansible.com/YAMLSyntax.html) which are worth reading up on.


Here's a small example:
```
---
- name: Initial playbook
  tasks:
   - ...
```

Let's run a sample playbook we added in the `workshop/examples` folder called `0_initial.yml`:

```
ansible-playbook ./workshop/complete_examples/0_initial.yml
```

Explanation about running with several hosts, about running with -i
