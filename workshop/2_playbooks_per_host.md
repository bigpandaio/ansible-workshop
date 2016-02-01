## Playbooks

Let's create two playbooks, one for each host type we have.

```sh
cp ./workshop/complete_examples/step_2/*.yml ./
```

Run it with:

```sh
ansible-playbook web.yml
ansible-playbook app.yml
```

### ZOMG WE CAN APT SOURCES

You might have noticed that we didn't pass the `-i inventory` parameter to `ansible-playbook`, this is because we defined that as a default in `ansible.cfg`.

If we peek at the playbooks we see some **Jinja** magic:

```yaml
- name: App Server
  hosts: role_app:{{ ('&' + limit) }}
  tasks:
    - name: Update apt cache
      apt: update_cache=yes
```

What we did here was allow the **limit** parameter to be passed, this ensures that even if this playbook is included and not ran directly, the **limit** will be respected.

If you're not familiar with **limit**, it's a parameter which allows us to , ahem, limit the playbook's target hosts.

Say that we had 5 app servers (app-1 to app-5), and we only wanted to run `app.yml` on one of them:

```sh
ansible-playbook ./web.yml --limit app-1
```

You can use your role groups, wild cards and more patterns, see [here](http://docs.ansible.com/ansible/intro_patterns.html) for more details.

### Fine, we added one task, how will it look with hundreds of tasks?

Well, we could add everything that has to do with **nginx** to the `web.yml` playbook, but that wouldn't be very elegant would it?

Let's get to the main part of this workshop, [ZE SHINING ROLEZ](./3_rolez_ftw_nginx.md)
