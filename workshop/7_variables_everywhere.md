## Where did that value come from?

One of the biggest got'cha with Ansible is when you're using a variable that suddenly has a value you didn't expect.

Although Ansible has a very defined order of variable loading, remembering isn't easy.

We'll try it out with a small exercise:

```bash
cp -r ./workshop/complete_examples/step_7/*_vars ./dev/
cp -r ./workshop/complete_examples/step_7/roles/vars ./roles/
cp ./workshop/complete_examples/step_7/varz.yml ./
```

Run this with:

```bash
ansible-playbook ./varz.yml
```

We can also pass that variable as a parameter to the playbook:

```bash
ansible-playbook ./varz.yml -e test_var=ZOMG32
```

### Hmm, where, what, how

Comment out the definition of `test_var` according the message you get when running, RINSE, REPEAT

_THIS WILL TAKE A WHILE!!1_

Then run again with passing a parameter.

### That was intense, need something to relax?

You're absolutely right, [Security Time](./8_hide_all_secrets.md)!