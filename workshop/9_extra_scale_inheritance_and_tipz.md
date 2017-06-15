## Extra Nuggets

### Inheritance

A supercool feature of Ansible is **Inheritance**.

Our `app` role is already ready to be an abstract role, since we set the app name, port and cow type (!) as default parameters.

#### Adding another role that inherits the `app` role is as easy as:

Adding a `roles/<ROLE>/meta/main.yml`:

```yaml
---
dependencies:
- { role: app, tags: ['app', 'cow'] }
```

And updating the **nginx** roles default `apps` dict.

Finally, updating our `app.yml` to use the new roles instead of the `app` role.

As before, to save you some typing, here's the complete examples:

```sh
cp -r ./workshop/complete_examples/step_9/roles/{cow,elephant} ./roles
cp ./workshop/complete_examples/step_9/roles/nginx/defaults/main.yml ./roles/nginx/defaults/main.yml
cp ./workshop/complete_examples/step_9/app.yml ./
```

#### Ship It!

```sh
ansible-playbook ./deploy.yml
curl -s 'ansible:<GENERATED_PASSWORD>@localhost:8083/elephant'
```

LaBoomz, we now have an elephant app!

![SEE ME IN THE ROOM](https://github.com/bigpandaio/ansible-workshop/blob/apprentice-workshop-docker/memez/ascii-elephant.jpg?raw=true)

_Bonus_: `open http://localhost:8083` (or `gnome-open` if you're on Ubuntu with Gnome).

### Hmm, what was the checklist we talked about before?

- [x] Should be easy to deploy app changes (infra, single deploy.yml, tags per app)
- [x] Should be easy to add new Apps (w00tz elephant and cow!)
- [ ] Should be easy to add new servers

### What about another server?

Run:

```sh
ansible-playbook ./bootstrap/setup.yml -e add_second_app=True
ansible-playbook ./bootstrap/test.yml
```

If the test fails, as we did before starting, run

```
ansible-playbook ./bootstrap/fix_apt.yml
```

Yaay, another docker container is up!

```sh
ansible-playbook ./deploy.yml --limit \!ansible-workshop-app-1 --tags=all
#no skip tags, new server!
ansible app -a 'curl -s localhost:3000'
ansible app -a 'curl -s localhost:3001'
```

Notice the `--limit` we used here.
You can use your host groups, wild cards and more patterns, see [here](http://docs.ansible.com/ansible/intro_patterns.html) for more details.
In our case, we didn't want to run the deploy on the existing app server.

That's how easy it is to add a new server.

### MOAR tips:

One of the common pain in Ansible is actually not Ansible, it's **YAML**.
Do yourself a favor, lint your **YAML**.

While you're at it, you can also lint your Ansible **YAML** using [ansible-lint](https://github.com/willthames/ansible-lint).

![WHITESPACES EVERYWHERE](https://github.com/bigpandaio/ansible-workshop/blob/apprentice-workshop-docker/memez/whitespace.jpg?raw=true)

Another helpful nugget is [Ansible Toolkit](https://github.com/dellis23/ansible-toolkit), which also includes other usable tools such as diffing vault files without committing any changes (`atk-git-diff`).

### That's it folks!
