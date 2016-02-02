## Secrets and Security

Now, if this amazing cow app was deployed in production, we should probably secure it in some way.

To keep it simple in this workshop, we'll keep it simple by using **nginx** basic authentication.

### Show me the path to security

To add basic authentication, we'll need to change the **nginx** role.

```sh
cp -r ./workshop/complete_examples/step_8/roles/nginx ./roles
```

Then deploy again with:

```sh
ansible-playbook ./deploy.yml --tags web
```

And we'll test the authentication:
```sh
curl -s localhost:8083/cow
```

#### Yaay! it didn't work!

```sh
curl -s 'ansible:ohnoez@localhost:8083/cow'
```

That's better.

_Or is it_?

![SECURELY COMMITTED CLEAR TEXT](https://i.imgflip.com/ye9jg.jpg)

We have a password hard coded into git.

### Vault to the rescue

Ansible provides a simple {en,de}crypt solution called Ansible Vault.

To use it you need to create a password for encrypting and decrypting:


```sh
echo $RANDOM > ./.ansible-vault-pass
#so secure so much secure, wow
```

Now we need to create an encrypted vault file, But before creating the file, In order for Ansible to pick it up automagically, we'll move the previous `dev/group_vars/web` it it's own directory:

```sh
mv ./dev/group_vars/web{,_}
mkdir ./dev/group_vars/web
mv ./dev/group_vars/web_ ./dev/group_vars/web/web
```


Then create a _"vaulted"_ file, and add the `webserver_password` variable.

```sh
ansible-vault create --vault-password-file=./.ansible-vault-pass dev/group_vars/web/vault
```

Since Ansible automagically includes all files in `group_vars/<GROUP_NAME>/` if it's a directory, the vaulted file will also be included.

Awsmz, let's run it:

```sh
ansible-playbook ./deploy.yml --tags web
```

### Oh noez

```sh
ERROR: A vault password must be specified to decrypt
```

If we tell Ansible where are password file is though:

```sh
ansible-playbook ./deploy.yml --vault-password-file=./.ansible-vault-pass --tags web
```

And to test if it actually worked:

```sh
curl -s 'ansible:ohnoez@localhost:8083/cow'
curl -s 'ansible:<GENERATED_PASSWORD>@localhost:8083/cow'
```

Adding `--vault-password-file` to each Ansible command is annoying, but solvable:

```sh
echo "vault_password_file = ./.ansible-vault-pass" >> ansible.cfg
```

And Voila, we can now run `ansible-playbook` without specifying the password file.

### But that's just clear text in a file, how's that secure?

Well, Ansible thought about that as well. The password file can also be an executable, E.g. LastPass cli.

### One last Gotcha

The reason we put the vaulted file in the newly created `dev/group_vars/web/` folder (as opposed to the `all` folder) was that you can't really `git diff` changes to a vault file.
Thus you'll probably want to split up the vaulted files to something that fits host groups (or even `host_vars`).

### Now, if we got here and still got time

Here's some [extra nuggets](./9_extra_scale_inheritance_and_tipz.md).
