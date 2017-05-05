# ocp-client-download

Create and buld the app

```
oc new-app <this git repo_>
```
Create a route

```
oc expose svc --name=oc
```
Modify & copy the cli-links.j2 to the masters

Add the correct config - https://docs.openshift.com/enterprise/3.2/install_config/web_console_customization.html#adding-or-changing-links-to-download-the-cli
