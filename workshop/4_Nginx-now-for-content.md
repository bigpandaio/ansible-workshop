## Ok, We're Ninjas! Nginx is now MANAGED like a boss.

#### Let's add content!

To prevent any religious **Y U DEPLOY THIS TECH INSTEAD OF MINE**, we'll generate some static content for Nginx, with NO BACKEND.

Let's change the default Nginx site to something we created, and even ADD OUR OWN HOMEPAGE.
Man, this is Geocities all over again! The excitement!!1

```
- name: Initial playbook
  hosts: all
  tasks:
    - name: Install nginx on Ubuntu/Debian
      apt:  name=nginx state=present
      sudo: yes
      when: ansible_os_family == "Debian"

    - name: Install nginx on RedHat/CentOS
      yum:  name=nginx state=present
      sudo: yes
      when: ansible_os_family == "RedHat"

    - name: Validate that nginx is installed
      uri:  url=http://localhost method=HEAD

    - name: Create static root dir
      file: path=/var/www/workshop state=directory owner=www-data group=www-data
      sudo: yes
    
    - name: Copy static HTML files to root dir
      copy: src=resources/index.html dest=/var/www/workshop owner=www-data group=www-data
      sudo: yes
```

#### So what did we do here?

We told Ansible to copy a static file from our repo to the server.

We also told Ansible to ensure the permissions on the copied file so Nginx will be able to access them.

BUT WAIT...

Who said that /var/www/workshop is the default root for Nginx?

Let's update the Nginx site definition with our own (and remove the default).

```
...
    - name: Disable default site in Nginx
      file: path=/etc/nginx/sites-enabled/default state=absent
      sudo: yes

    - name: Add our own nginx site
      copy: src=workshop/resources/nginx-site.conf dest=/etc/nginx/sites-available owner-www-data group=www-data
      sudo: yes

    - name: Symlink our nginx site
      file: state=link src=/etc/nginx/sites-available/nginx-site.conf path=/etc/nginx/sites-enabled/nginx-site.conf owner=www-data group=www-data
      sudo: yes

    - name: Reload nginx service
      service: name=nginx state=reloaded
      sudo: yes
```

Now we can open our amazing SINGLE PAGE APP [here](http://127.0.0.1:8083)

#### I SEE WHAT U DID THERE...

We copied or own Nginx site definition using the `copy` module, made sure it was enabled by using the `file` module to symlink the file, then reloaded the Nginx service using the `service` module.

#### But it's all sooooo... STATIC

Indeed, let's spice things up shall we?

Let's make the Nginx configuration **DYNAMAGIC**!

We'll replace the copy task we just wrote with this nifty snippet that uses the `template` module:

```
...
    - name: Generate our own nginx site
      template: src=workshop/resources/nginx-site.conf.template dest=/etc/nginx/sites-available/nginx-site.conf owner-www-data group=www-data
      sudo: yes
```

The `template` module uses Jinja (A python template engine that rocks) to render the template.

#### WAIT WAT

Let's run the playbook again.

Now we `curl`, *Justin style*™:

```
curl http://127.0.0.1:8083/answer
curl http://127.0.0.1:8083/when
```

#### AGAIN, WAT?

Let's look at the template used in that nifty snippet:

```
...

  location /when {
    add_header "Content-Type" "text/text";
    return 200 "Deployed at {{ ansible_date_time.date }} at {{ ansible_date_time.time }}";
  }

  location /answer {
    add_header "Content-Type" "text/text";
    return 200 "{{ magic_answer|default(42)}}";
  }


```

#### HERE BE DRAGONS?!?!

Nope, what you're seeing here is a Jinja template, that uses Ansible variables.

The `ansible_date_time` variable is injected by Ansible, which we use to calculate the deployment time.

The second part is more interesting, here we use the `magic_answer` variable, and we pass that to a Jinja filter called `default`, that will replace the value with the parameter if the variable is undefined.

Let's run the playbook again, and override our `magic_answer` variable:

```
ansible-playbook -i ansible/hosts ./nginx-awesome.yml -e magic_answer=1337
```

CURL TIME:

```
curl http://127.0.0.1:8083/answer
```

There's loads of Jinja filters available, from string manipulations to list comprehensions, and guess what, they're extendable! You can write the yourself in Python (FTW™).

#### MIND BLOWN.

![MIND BLOWN](http://i.imgur.com/C4buo.gif)

Let's to a small break, we'll probably need some snacks to make all of this AWESOMENESS melt in.
See you in 5 minutes at [the next step](./5_Loops-Oh-My.md).
