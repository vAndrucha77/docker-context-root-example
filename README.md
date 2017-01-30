docker-context-root-example
===========================

Example method to route multiple requests to a single hostname with different backend containers; also known as context root mapping.  This utilizes the internal DNS based service discovery to access the different containers based off of the service name defined in the compose file.

Environment standup
  * You need docker anad docker-compose for this to work
  * `make up`

Environment teardown
  * `make down`
