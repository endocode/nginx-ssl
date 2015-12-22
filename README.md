# Simple Nginx SSL/TLS Docker Container

Very basic nginx docker container. The nginx runs on ports `80` and `443`
inside the docker container, whereby port `80` is redirected to `443`. We only
allow 'https'.

## Pre-Requirements

```
$ mkdir /tmp/ssl
$ openssl req -x509 -nodes -days 1 -newkey rsa:4096 -subj "/C=DE/ST=Berlin/L=Berlin/O=Endocode AG/OU=IT/CN=localhost" -keyout /tmp/ssl/nginx.key -out /tmp/ssl/nginx.crt
```

## Build

```
$ docker build -t nginx-ssl:1.9.9 .
```

## Run

```
$ docker run -p 80:80 -p 443:443 -v /tmp/ssl/:/etc/nginx/ssl/ nginx-ssl:1.9.9
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

# Kubernetes CoreOS Environment

## Pre-Requirements

* The built `nginx-ssl:1.9.9` docker container (see above)
* A running kubernetes cluster, e.g. check out `deploy_coreos_libvirt.sh` from [https://coreos.com/os/docs/latest/booting-with-libvirt.html]

## Run

```
$ kubectl create -f nginx-ssl.yaml
```

## Check

```
$ curl -k https://${CLUSTER_IP_ADDRESS}:30443
```
where `CLUSTER_IP_ADDRESS` is the IP address of your kubernetes master.

