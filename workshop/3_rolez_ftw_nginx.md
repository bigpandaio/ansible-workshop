## Roles for Queen and glory

Let's create a basic role for installing **nginx**.

Roles reside in the **roles** directory (surprisingly).

Within each role, there are several sub directories according to the Ansible convention.

### What's in each of those folders?

In the [Ansible documentation](http://docs.ansible.com/ansible/playbooks_best_practices.html#directory-layout), this is explained rather thoroughly, but here's a quick recap:

#### Tasks

Tasks, as we added previously to our main playbook under **tasks**.

#### Handlers

As we added before in the main playbook, used for `notify`, running tasks only when needed.

#### Vars 

Variables for current role.

#### Defaults

Variables to be overridden (We'll talk about this later).

#### Templates

Jinja templates to be used with the `template` task.
Ansible will look up templates in this folder for this role, saving the need to write in an explicit path in the task.

#### Files

Same as templates, just not dynamic.

#### Meta

This is where you'd define inheritance if existing.

**NOTE:** By default, for each of these folders, the `main.yml` file will be loaded by default by Ansible (except for **files** and **templates**).

### Fine fine, let's get to work

To keep things simple, We'll copy the **nginx** tasks from the previous workshop, organized in a role:

```sh
cp -r ./workshop/complete_examples/step_3/roles ./
cp ./workshop/complete_examples/step_3/web.yml ./
```

### Let's have a look at what we added here shall we?

We now have:

- tasks defined in the `roles/nginx/tasks/main.yml` file
- a handler in `roles/nginx/handles/main.yml`
- some static files used by nginx (configuration and home page)
- Overwrite the previous playbooks to use roles

### How do we use this role?

Well, we deleted the previous `apt` task and added the following to our `web.yml`:

```yaml
- name: Web Server
  hosts: role_web
  roles:
    - nginx
```

### Now to deploy it:

```
ansible-playbook ./web.yml
```

Then: `open http://localhost:8083` (or `gnome-open` if you're on Ubuntu with Gnome).


### BOOOMZ

What we've achieved now is that any new server or app that needs **nginx**, we'll just add that role and deploy.

### OMG TIS' SO EXCITING

Let's write another role shall we? [ZE APP ROLE](./4_rolez_ftw_ze_app.md)
