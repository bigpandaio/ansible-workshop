## Secrets and Security

Now, if this amazing cow app was deployed in production, we should probably secure it in some way.

To keep it simple in this workshop, we'll keep it simple by using **nginx** basic auth.

### Show me the path to security

To add basic auth, we'll need to change the **nginx** role.

```bash
cp -r ./workshop/complete_examples/step_8/roles/nginx ./roles
```

Explanation about vault
Add etc auth password tasks + nginx conf
Talk about executable vault password (lpass cli as en example)


### Now, if we got here and still got time

Here's some [extra nuggets](./9_extra_scale_inheritance_and_tipz.md).
