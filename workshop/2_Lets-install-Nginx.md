## Sweet, so playbooks rock, what do I do with them?

#### Let's install us something common and simple shall we? - Nginx

![I DON'T ALWAYS INSTALL SOMETHING SIMPLE, BUT WHEN I DO IT'S THE MOST POPULAR HIGH PERFORMANCE WEBSERVER OUT THERE](http://cdn.meme.am/instances2/500x/178503.jpg)


#### Bootstrapping our new playbook

Let's start by making a copy of the last dummy playbook to save some time:

```
cp ./workshop/complete_examples/0_initial.yml ./nginx-awesome.yml
```

Let's open that in our favorite `$EDITOR`

```
---
- name: Initial playbook
  hosts: all
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
  hosts: all
  tasks:
    - name: Install nginx
      apt: name=nginx state=present
      sudo: yes
```

Needless to say, we'll need the *Install nginx* task to run as sudo.
And now we run it as before:

```
ansible-playbook -i ansible/hosts ./nginx-awesome.yml
```

And we can test that it works by doing:

```
curl -I 127.0.0.1:8083
```

**NOTE:** *`8083` is a port set up in the vagrant file that is forwarded from the vm's port 80.*

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

#### THIS IS ALL SO EXCITING

But.. this is kind of to tight coupled with installing Nginx on Ubuntu.

How would we be able to use the same playbook, say on CentOS?

That's an excellent question, see the [next step](./3_Nginx-the-plot-thickens.md).
