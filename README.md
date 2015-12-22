# Simple Nginx SSL/TLS Docker Container

Very basic nginx docker container. The nginx runs on ports `80` and `443`
inside the docker container, whereby port `80` is redirected to `443`. We only
allow 'https'.

**CAUTION:** *the key and the certificate are created, when building the container,
for the sake of simplicity. In a real world scenario the key and the
certificate have to be created outside the container and copied into it.*

## Build

```
$ docker build -t nginx-ssl:1.9.9 .
```

## Run

```
$ docker run -p 80:80 -p 443:443 nginx-ssl:1.9.9
```

## Check

```
$ curl http://localhost
```
You'll see a `301 Permanently Moved` message.

Next line gives you the expected output:
```
$ curl -k https://localhost
```

You can also put `localhost` into your browser and see, what happens.

## Inspect

You can inspect a running `nginx-ssl` instance by getting a bash inside the
container:
```
$ docker exec -t -i $(docker ps|grep nginx-ssl:1.9.9|awk '{print $1}') bash
```

