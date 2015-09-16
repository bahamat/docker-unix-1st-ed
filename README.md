# Unix, 1st Edition

Based on the [Unix 1st Edition June 1972](https://github.com/bahamat/Unix-1st-Edition-jun72) source.

## Building

You don't need to build yourself, you can just run the published Docker image. However if you do want to build it, just clone this repo and run `make`. You'll need a functioning dev environment (e.g., `build-essential`) and `unzip` in your path.

## Usage

### Interactively

    docker run --rm -it bahamat/unix-1st-ed

### Remotely

    docker run -d -P bahamat/unix-1st-ed

## Logging In

Type `root` at the `login:` prompt. If you're running remotely use `docker ps` to see which IP/port to `telnet` to.

Example:

    $ docker run -d -P bahamat/unix-1st-ed
    7138370d4670dbab9535ea4bb3816b6ca6d02d31d8e531def5c8555046aa8ce9
    $ docker ps
    CONTAINER ID        IMAGE                 COMMAND                CREATED             STATUS              PORTS                     NAMES
    7138370d4670        bahamat/unix-1st-ed   "/bin/sh -c ./simh.c   25 seconds ago      Up 23 seconds       0.0.0.0:32769->5555/tcp   elated_bohr
    $ telnet localhost 32769
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.


    Connected to the PDP-11 simulator DCI device, line 0


    login: root
    # ls
    bin
    dev
    etc
    tmp
    #
