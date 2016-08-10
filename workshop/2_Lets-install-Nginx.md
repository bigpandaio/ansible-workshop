## Sweet, so playbooks rock, what do I do with them?

#### Let's install us something common and simple shall we? - Nginx

![I DON'T ALWAYS INSTALL SOMETHING SIMPLE, BUT WHEN I DO IT'S THE MOST POPULAR HIGH PERFORMANCE WEBSERVER OUT THERE](https://github.com/bigpandaio/ansible-workshop/blob/noob-workshop-docker/memez/i_dont_always_nginx.jpg?raw=true)

#### Bootstrapping our new playbook

Let's start by making a copy of the last dummy playbook to save some time:

```
cp ./workshop/complete_examples/0_initial.yml ./nginx-awesome.yml
```

Let's open that in our favorite `$EDITOR`

```
---
- name: Initial playbook
  hosts: ansible-workshop
  tasks:
    - name: Ping server
      ping:
```

Now that ping task is really not needed, DELETE IT!

#### Making our playbook install Nginx

Let's install Nginx using the `apt` module.
The `apt` module takes the name of the package we want to install and the state `(present|latest|absent|build-deb)`:

```
---
- name: Initial playbook
  hosts: ansible-workshop
  tasks:
    - name: Install nginx
      apt: name=nginx state=present
```

*NOTE:* Usually, we'd need the *Install nginx* task to run as a privileged user (in our case the docker image is already using the root user).
To achieve that, we'd add `become: yes` to the task.
And now we run it as before:

```
ansible-playbook -i ansible ./nginx-awesome.yml
```

And we can test that it works by doing:

```
curl -I 127.0.0.1:8083
```

**NOTE:** `8083` is a port set up during the setup stage (`ansible-playbook ./bootstrap/setup.yml`). There we used ansible to expose the port `80` at the running docker container to `8083` on the host.

#### Wait a minute, why not check that in Ansible?

Let's add a dummy health check shall we?
We'll use the `uri` module, and do a quick `HEAD` request.

```
...
  tasks:
    ...
    - name: Validate that nginx is running
      uri: url=http://localhost method=HEAD
```

#### ZOMG it's not working!!1

Sometimes installing nginx is not enough, you actually have to kick the tires by starting the service:

```
...
    - name: Verify that nginx is started
      service: name=nginx state=started

    - name: Validate that nginx is running
      uri: url=http://localhost method=HEAD
```

#### THIS IS ALL SO EXCITING

But.. this is kind of to tight coupled with installing nginx on Ubuntu.

How would we be able to use the same playbook, say on CentOS?

That's an excellent question, see the [next step](./3_Nginx-the-plot-thickens.md).
