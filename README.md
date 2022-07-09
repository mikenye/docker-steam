# Docker Container for Steam

This container is a work in progress.

It implements Steam running on Linux, inside a Docker Container.

The eventual plan is to use this container to play games (native Linux and Proton) via Steam Remote Play.

It is far from done, however I have managed to play a couple of native Linux games via the NoVNC web interface.

This container builds upon the excellent work done in the [jlesage/baseimage-gui](https://hub.docker.com/r/jlesage/baseimage-gui) container.

## Preparation

1. Install Docker.
2. Run this command to build:

```
docker build . --tag steam
```

## Running

So far, I've had success running like this:

```
docker run \
    --rm \
    -it \
    --name steam \
    --shm-size 256M \
    --network=host \
    --privileged \
    -v steam:/steam \
    steam
```

You can then browse to http://dockerhost:5800/, log in as yourself, install a game and try it out.

You may need to run `modprobe uinput` on the docker host prior... See how you go.

## Current Status

* Steam launches, and I can log in and install games.
* I have had success launching two native Linux titles:
  * PixelJunk Monsters Ultimate
  * PixelJunk Shooter
* I have had moderate success with Undertale (native Linux)
* I have had no success with Proton games, I think this is due to the fact that I'm not passing through a GPU to the container... I will test this further as time permits.
* For Remote Play:
  * Keyboard/Mouse input seems to work fine
  * Gamepad input seems hit and miss
  * Sound doesn't appear to be working (it has worked in the past...)

## Troubleshooting

I've had an issue where on subsequent runs, a segmentation fault occurs. I've found deleting the `steam` volume and having Steam re-install seems to fix it up. It's annoying but I haven't figured out a fix yet.

## Collaborate!

If this interests you, please get involved!

Please fork, make changes, submit pull requests, open issues, etc.

I don't think I'm good enough to get this running perfectly on my own. :-)

## Screenshots

* [PixelJunk Monsters via NoVNC](https://i.imgur.com/7FVqXm5.mp4)


