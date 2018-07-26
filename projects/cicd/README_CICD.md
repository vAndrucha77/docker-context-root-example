docker-context-root-example for CICD 
====================================

Example method to route multiple requests to a single hostname with different backend containers; also known as context root mapping.  This utilizes the internal DNS based service discovery to access the different containers based off of the service name defined in the compose file.

Environment standup
  docker build -t context-root-example:router -f Dockerfile.cicdrouter .
  
  * You need `docker` and `docker-compose` for this to work; `make` if you want to use the `Makefile`
  * `make up`

Environment teardown
  * `make down`

By default, the router will listen on port 80 (hostname doesn't matter in this case) and there is an index at `/` that has links to the the examples GitLab and Jenkins
