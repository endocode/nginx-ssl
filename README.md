# Simple Nginx Docker Container

Very basic nginx docker container. The nginx runs on port `80` inside the
docker container.

## Build

Execute:
```
$ docker build -t simple-nginx-container .
```

## Run

Execute:
```
$ docker run -p 8080:80 simple-nginx-container
```

## Check

Execute:
```
$ curl http://localhost:8080
```

