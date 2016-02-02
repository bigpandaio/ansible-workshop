## Connect ALL THE THINGZ

We've got our web server and our app server, but they don't really have a way to communicate.

Let's get them to know each other by updating their `/etc/hosts`.

Copy the file `workshop/complete_examples/step_5/hosts.yml` to the root directory:

```sh
cp workshop/complete_examples/step_5/hosts.yml ./
```

What we're doing in this playbook is simple:

- Remove previous private IP of machines at other machines if exiting
- Add new IP at other machines

Notice that the playbooks hosts is `all`, and we're limiting the task to not run on themselves.

The tasks themselves run iterate on `groups.all`, which is the same as the playbook hosts.

We could also have used `play_hosts` here, which is another Ansible magic variable that does this (albeit limited to current play, so if we run with `serial=1`, `play_hosts` will be populated per serial run).

Furthermore, we're accessing `hostvars`, which our dynamic host script generates for us.

Although `private_ip` is a quick hack we did in our dynamic host script, other providers such as AWS have similar features, E.g. `private_ip` would be `ec2_private_ip_address`.

**NOTE:** In other providers you might need to open the port between the hosts.

### Test it!

```sh
ansible-playbook ./hosts.yml
ansible role_web -a 'curl -s app-1:3000'
```

Man that cow is awesome.

![ZE LA FAN!](http://i.imgur.com/OWTWH8G.gif)

### Ok that's fine, there's communication between the machines

Let's update the **nginx** role to proxy requests to our backend app server.

```sh
cp -r workshop/complete_examples/step_5/roles/nginx ./roles/
ansible-playbook ./web.yml
ansible role_web -a 'curl -s localhost/cow'
```

What we've changed here is the **nginx** template:

```jinja
{% for app, port in apps.iteritems() %}
upstream {{ app }}-cluster {
{% for node in app_servers %}
  server {{ node }}:{{ port }} max_fails=3 fail_timeout=10s;
{% endfor %}
  keepalive 16;
}
{% endfor %}
```

### WAT DA DUCKING DUCK?!?!?

![DUCK THIS!](https://media.giphy.com/media/xvGEx3cazysda/giphy.gif)

Let's rewind a bit and have a looksie in our new `roles/nginx/defaults/main.yml`

```yaml
apps:
  cow: 3000
app_servers: "{{ groups.app | default([]) }}"
```

`apps` is a dict with app names and ports.
`app_servers` is an array of all the machines that are app machines (one in our case), which is _piped_ to `default([])` in case it's missing.

### Ooooh, ok then.

So if we look back at the **nginx** site config template, we now understand that we're iterating on our `apps` dict, then on each app server in `app_servers` and creating **nginx** upstream.

We then create a new location per app, `proxy_pass`-ing to the app-cluster we created.
Basically this means that if we were to add MOAR apps or MOAR app servers, our playbooks will still work.

![DUCKEY FUNK!](https://media.giphy.com/media/b9QBHfcNpvqDK/giphy.gif)

### This is all very exciting, but...

Deploying this seems tedious, we need to run 3 different playbooks, not only that, each time we run, it'll verify tasks such as **nginx** which is more infrastructure and not likely to change much.

Let's improve that in [using Ansible's tags](./6_tag_all_the_thingz.md)
