## Amazing app role

### As with the **nginx** role, we'll save some time by copying some examples:

```sh
cp -r ./workshop/complete_examples/step_4/roles/app ./roles/
cp ./workshop/complete_examples/step_4/app.yml ./
```

### What did we copy this time?

- An upstart template
- Default variables to be overridden
- Application Variables
- Tasks that download `http-cow` ([source](http://github.com/erikzaadi/http-cowsay)) and generates the service that runs this AMAZING server
- Rewrote playbook to use roles

### How do we use this role?

As before in the `web.yml`, we did the same with `app.yml` by deleting the previous `apt` task and adding:

```yaml
- name: App Server
  hosts: app
  roles:
    - app
```

### Let's run that:

```
ansible-playbook ./app.yml
```

### And to test it:

```sh
ansible app -a 'curl -s localhost:3000'
```

Why hello there gorgeous!

### We've deployed our app, that's it, workshop is over.

.

.

.

.

### NOT

Let's [connect](./5_connecting_everything.md) the web server and the app server.
