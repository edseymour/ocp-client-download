# ocp-client-download

Create and buld the app

```
oc new-project client-tools
oc new-app <this git repo_>
```
Create a HTTPS route

```
oc create route edge oc --service=ocp-client-download --insecure-policy='Redirect'
```
Modify the cli-links.j2 to point at the route created where the cli tools are hosted

Create a configmap with the modified cli-links.j2

```
oc create configmap links --from-file=cli-links.j2
```

Add the config map to the DeploymentConfig

```
oc volumes dc/ocp-client-download --add --type=configmap -m /var/www/html/js --configmap-name=links
```

Add the correct config to the web-console configmap 

```
oc edit configmap webconsole-config  -n openshift-web-console
```
Should look something like:
```
extensions:
  properties: {}
  scriptURLs: 
    - https://oc-client-tools.apps.skylake.demolab.local/js/cli-links.j2
```

See the docs here for any further info - https://docs.openshift.com/container-platform/3.9/install_config/web_console_customization.html#adding-or-changing-links-to-download-the-cli