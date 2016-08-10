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

### ZOMG WE CAN HAZ CONTAINER NAMES

You might have noticed that we didn't pass the `-i inventory` parameter to `ansible-playbook`, this is because we defined the inventory name in `ansible.cfg`.

### Fine, we added one task, how will it look with hundreds of tasks?

Well, we could add everything that has to do with **nginx** to the `web.yml` playbook, but that wouldn't be very elegant would it?

Let's get to the main part of this workshop, [ZE SHINING ROLEZ](./3_rolez_ftw_nginx.md)
