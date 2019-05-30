# docker-sonos-api
This image will create a container providing an API for your Sonos environment. The API functionality is provided by the GitHub Project from Jimmy Shimizu at GitHub (https://github.com/jishi/node-sonos-http-api).

## Usage
I recommend using [portainer](https://www.portainer.io/) for deploying containers in your home environment as it will save you a lot of typing. It's very simple to [install](https://www.portainer.io/installation/) as well.

If you prefer to run this container manually, just use this command to create a container from this image. In this example the network stack of the container is not isolated as it uses the host network. It's the fastest way to get the container working. 

```
# create a volume for the presets files, refer to jishis git repo for usage information
$ docker volume create sonos-api_presets

# run the container
$ docker run -d --name sonos-api \
  -v sonos-api_presets:/nodes/node-sonos-http-api/presets \
  --network host \
  --restart always \
  stfnbstl/sonos-api:latest
```
