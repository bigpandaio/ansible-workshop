## Secrets and Security

Now, if this amazing cow app was deployed in production, we should probably secure it in some way.

To keep it simple in this workshop, we'll keep it simple by using **nginx** basic auth.

### Show me the path to security

To add basic auth, we'll need to change the **nginx** role.

```bash
cp -r ./workshop/complete_examples/step_8/roles/nginx ./roles
```

Then deploy again with:

```bash
ansible-playbook ./deploy.yml --tags web
```

And we'll test the authentication:
```bash
curl localhost:8083/cow
```

#### Yaay! it didn't work!

```bash
curl 'ansible:ohnoez@localhost:8083/cow'
```

That's better.

Or is it?

IDONTALWAYSSECUREPASSWORDINGIT

We have a password hard coded into git.

### Vault to the rescue

Ansible provides a simple {en,de}crypt solution called Ansible Vault.

To use it you need to create a password for encrypting and decrypting:


```bash
echo $RANDOM > ./.ansible-vault-pass #so secure so much secure, wow
```

Then create a _"vaulted"_ file, and add the `webserver_password` variable:

```bash
ansible-vault create --vault-password-file=./.ansible-vault-pass dev/group_vars/all/vault
```

Since Ansible automagically includes all files in `group_vars/all` if it's a directory, the vaulted file will also be include.

Awsmz, let's run it:

```bash
ansible-playbook ./deploy.yml --tags web
```

### Oh noez

```bash
ERROR: A vault password must be specified to decrypt
```

If we tell Ansible where are password file is though:

```bash
ansible-playbook ./deploy.yml --vault-password-file=./.ansible-vault-pass --tags web
```

And to test if it actually worked:

```bash
curl 'ansible:ohnoez@localhost:8083/cow'
curl 'ansible:<GENERATED_PASSWORD>@localhost:8083/cow'
```

Adding `--vault-password-file` to each Ansible command is annoying, but solvable:

```bash
echo "vault_password_file = ./.ansible-vault-pass" >> ansible.cfg
```

And Voila, we can now run `ansible-playbook` without specifying the password file.

### But that's just clear text in a file, how's that secure?

Well, Ansible thought about that as well. The password file can also be an executable, E.g. LastPass cli.

### One last Gotcha

It's not a vault thing per say, but the only directory Ansible auto-includes is `group_vars/all` if it's a directory.
Since you can't really `git diff` changes to a vault file, you'll probably want to split up the vaulted files to something that fits host groups.

In order for this to work, you'll have to manually include the vars file in the playbook:

```yaml
  ...
  vars_files:
    - "{{ inventory_dir }}/group_vars/vault/your_group_var"
  ...
```

### Now, if we got here and still got time

Here's some [extra nuggets](./9_extra_scale_inheritance_and_tipz.md).