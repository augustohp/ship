# SHIP: Shell Helper To Initialize (Dockerfiles) in a new Project

Let's create a new image, on an existing repository, to install [bash][]:

    host      $ cd <repository path>
    host      $ ship
    container $ apk add --no-cache bash
    container $ exit
    Dockerfile written successfully!
    host      $ cat Dockerfile
    # Created using https://github.com/augustohp/shell-dock
    FROM alpine:latest
    LABEL maintainer="John Doe <john@example.org>"

    RUN apk add --no-cache bash

What happened?

1. The container specified was executed in iterative mode
1. The current directory was mounted at `/home/developer`
1. The `history` of the container was converted to `RUN` instructions in the `Dockefile`

