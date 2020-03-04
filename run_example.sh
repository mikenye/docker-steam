#!/bin/bash
docker run --rm -it --name steam --shm-size 256M --network=host --privileged -v steam:/steam steam
