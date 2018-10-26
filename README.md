Engineyard gem, pinned to ruby 2.3

## Building
```sh
docker build -t ey . \
  --build-arg USER_UID=`id -u` \
  --build-arg USER_GID=`id -g` \
  --build-arg USER_NAME=`id -un`
```

## Running (probably want to alias this)

```
docker run -it --rm  \
  -u `id -u` \
  -v "$HOME/.ey:/home/`id -un`/.ey" \
  -v "`pwd`:/home/`id -un`/wd" \
  -v "$SSH_AUTH_SOCK:/ssh-agent" \
  --workdir "/home/`id -un`/wd" ey
```
