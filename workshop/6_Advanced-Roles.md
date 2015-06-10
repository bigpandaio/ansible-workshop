## WAT, Ansible can be even MOAR awesome?!?!

#### Convention over configuration

Ansible loves conventions. Conventions save time.

One of the way Ansible understands conventions is from directory structure.

E.g. all or files that we used, had they been in a `files` directory relative to the playbook, we woudn't have needed to specify the entire path.

Same thing for `templates`.

Now that would more clear as well when you look at the directory.

#### Now that's nice, but Ansible has something that'll rock your minds: Roles

In our scenario, we could easily divide our playbook into two logical parts: 

1. We need Nginx installed and configured
2. We need to deploy our amazing app

In Ansible terms, that's one Playbook, running two Roles:

1. Nginx
2. App, which is dependant on Nginx

#### Show me some!

Well that's for the next Ansible Hands on Workshop!

But you can peek a bit at [our examples](https://github.com/bigpandaio/ansible-workshop/tree/07-roles-dep/ansible) or the official [Ansible examples](https://github.com/ansible/ansible-examples)
