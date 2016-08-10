## Connect ALL THE THINGZ

We've got our web server and our app server, and thanks to docker, the web server knows about the app server (It's in `/etc/hosts` - check it out: `docker exec ansible-workshop-web cat /etc/hosts`)

*NOTE:* This is achieved by linking the containers, you can peek in `../bootstrap/setup.yml` to see how it's done.

### Test it!

```sh
ansible web -a 'curl -s ansible-workshop-app-1:3000'
```

##### Man that cow is awesome.

![ZE LA FAN!](https://github.com/bigpandaio/ansible-workshop/blob/apprentice-workshop-docker/memez/cowtastic.gif?raw=true)

### Ok that's fine, there's communication between the machines

Let's update the **nginx** role to proxy requests to our backend app server.

```sh
cp -r workshop/complete_examples/step_5/roles/nginx ./roles/
ansible-playbook ./web.yml
ansible web -a 'curl -s localhost/cow'
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

![DUCK THIS!](https://github.com/bigpandaio/ansible-workshop/blob/apprentice-workshop-docker/memez/ducking.gif?raw=true)

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

![DUCKEY FUNK!](https://github.com/bigpandaio/ansible-workshop/blob/apprentice-workshop-docker/memez/duckfunk.gif?raw=true)

### This is all very exciting, but...

Deploying this seems tedious, we need to run 3 different playbooks, not only that, each time we run, it'll verify tasks such as **nginx** which is more infrastructure and not likely to change much.

Let's improve that in [using Ansible's tags](./6_tag_all_the_thingz.md)
