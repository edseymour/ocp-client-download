# ocp-client-download

Create and buld the app

```
oc new-project client-tools
oc new-app <this git repo_>
```
Create a route

```
oc expose svc ocp-client-download --name=oc
```
Modify & copy the cli-links.j2 to the masters

Add the correct config - https://docs.openshift.com/container-platform/3.9/install_config/web_console_customization.html#adding-or-changing-links-to-download-the-cli
