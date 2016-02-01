## Extra Nuggets

### Inheritance

A supercool feature of Ansible is **Inheritance**.

We'll refactor our `app` role, to be an abstract role, getting the app name, port and cow type (!) as parameters:

```bash
cp -r ./workshop/complete_examples/step_9/roles/{cow,elephant} ./roles
cp ./workshop/complete_examples/step_9/roles/nginx/defaults/main.yml ./roles/nginx/defaults/main.yml
cp ./workshop/complete_examples/step_9/app.yml ./
```

#### Ship It!

```bash
ansible-playbook ./deploy.yml
curl -s 'ansible:<GENERATED_PASSWORD>@localhost:8083/cow'
```

LaBoomz, we now have an elephant app!

_Bonus_: `open http://localhost:8083` (or `gnome-open` if you're on Ubuntu with Gnome).

### Hmm, what was the checklist we talked about before?

- [x] Should be easy to deploy app changes (infra, single deploy.yml, tags per app)
- [x] Should be easy to add new Apps (w00tz elephant and cow!)
- [ ] Should be easy to add new servers

### What about another server?

Uncomment the following part in the `Vagrantfile`:

```ruby
  #config.vm.define "app-2" do |another_app|
  #  another_app.vm.hostname = 'app-2'
  #  another_app.vm.network :private_network, type: "dhcp"
  #end
```

Then

```bash
vagrant up app-2
ansible-playbook ./deploy.yml
#no skip tags, new server!
ansible tag_role_app -a 'curl -s localhost:3000'
ansible tag_role_app -a 'curl -s localhost:3001'
```

That's it!

### One last tip

One of the common pain in Ansible is actually not Ansible, it's **YAML**.
Do yourself a favor, lint your **YAML**.

While you're at it, you can also lint your Ansible **YAML** using [ansible-lint](https://github.com/willthames/ansible-lint).

WHITESPACESEVERYWHEREMEME
