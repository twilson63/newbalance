# NewBalance

This is a nodejs load balancer

## Features

* Dynamically Add/Remove servers from the balancer via web/cli
* Configure Heartbeat checking of servers in the balancer
* Remove inactive servers from the balancer
* Unobtrusive logging system
* SSL Support accept https, validate SSL, and re-route to http

## Install

``` sh
npm install newbalance
```

## Run

```
newbalance -http 8080 -https 8443 -admin 3000 -u user -p password
```

## Setup

When running newbalance you will need to create a redirect rule on your
server to route port 80 or port 443 to port 8080 and 8443 respectively,
or whatever ports you specify for newbalance, you can also specify a
specific user and password for the admin console which will default on
port 3000.  These configuration parameters can be specified on the
command line or specified in a json configuration file.

``` json
{
  "http": "8080",
  "https": "8443",
  "admin": "3000",
  "user": "admin",
  "password": "password"
}
```

It is also recommended to use `forever` or `monit` to monitor
`newbalance` and restart the server if it becomes inactive.

## Setup

Once NewBalance is running, you can now open a browser and point to the
NewBalance Server on port 3000 or whatever port you setup the admin
interface to listen on.  In this interface you can configure the
heartbeat settings, and add or remove servers to the balancer.  The
balance priority works on a Least Recently Used Cache, so the servers
will be rotated and balanced based on the server that was least recently
used.  NewBalance does not currently support sticky sessions.

Or if you do not like web interfaces you can use the api to add and
remove servers and configure the heartbeat settings.

PUT http://localhost:3000/settings
{
  "heartbeat": {
    "interval": 30,
    "uri": "/",
    "status": 200
  }
}

GET http://localhost:3000/settings
{
  "heartbeat": {
    "interval": 30,
    "uri": "/",
    "status": 200
  }
}

# Add Server to Balancer

POST http://localhost:3000/servers
{
  "ip": "192.0.0.20",
  "port": "8080"
}

# remove Server from Balancer

DELETE http://localhost:3000/servers
{
  "ip": "192.0.0.20",
  "port": "8080"
}


## Testing

``` sh
npm test
```

## License

See LICENSE

## Contributions


