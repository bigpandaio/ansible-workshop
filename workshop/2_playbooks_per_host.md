## Playbooks

Let's create two playbooks, one for each host type we have.

```bash
cp ./workshop/complete_examples/step_2/*.yml ./
```

Run it with:

```bash
ansible-playbook web.yml
ansible-playbook app.yml
```

### ZOMG WE CAN APT SOURCES

You might have noticed that we didn't pass the `-i inventory` parameter to `ansible-playbook`, this is because we defined that as a default in `ansible.cfg`.

If we peek at the playbooks we see some **Jinja** magic:

```yaml
- name: App Server
  hosts: tag_role_app:{{ ('&' + limit) }}
  tasks:
    - name: Update apt cache
      apt: update_cache=yes
```

What we did here was allow the limit parameter to be passed, this ensures that even if this playbook is included and not ran directly, the limit will be respected.

### Fine, we added one task, how will it look with hundreds?

Well, we could add everything that has to do with **nginx** to the `web.yml` playbook, but that wouldn't be very elegant would it?

Let's get to the main part of this workshop, [ZE SHINING ROLEZ](./3_rolez_ftw_nginx.md)
