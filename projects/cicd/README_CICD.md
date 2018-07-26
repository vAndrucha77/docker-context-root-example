docker-context-root-example for CICD 
====================================

Example method to route multiple requests to a single hostname with different backend containers; also known as context root mapping.  This utilizes the internal DNS based service discovery to access the different containers based off of the service name defined in the compose file.

1) Build a router image and push it to the DTR
  * docker build -t reponame/context-root-example:router -f Dockerfile.cicdrouter .

2) Push it to the DTR
  * docker push reponame/context-root-example:router

3) Deploy Docker Stack from router_cicd.yml file 
  * connect to UCP via client budle and `docker stack deploy -f router_cicd.yml cicdrouter` or via Docker EE UI.

    **Hint**: 
    * Replace FQDN's and image referencies in `router_cicd.yml` file. 
    * Add `ports` reference to the yml file if your service will be deployed outside of the `cicdrouter`stack, e.g. for GitLab:

+       ports:
             - '9080:80'
             - '9090:443'
             - '22:22'

#### Router configuration

By default, the router will listen on port 80 (hostname doesn't matter in this case) and there is an index at `/` that has links to the the examples GitLab and Jenkins.
If you want to add additional services to the config, first - add the new backend to `index.html` and `router.conf` and build a new image.

#### Referencies context roots

 External_url GitLab 
 - https://docs.gitlab.com/omnibus/settings/configuration.html
 - https://docs.gitlab.com/omnibus/docker/#pre-configure-docker-container
 
 How to set contexrt path in Jenkins
 - https://github.com/jenkinsci/docker/issues/68#issuecomment-355572068


