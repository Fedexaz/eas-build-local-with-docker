### Buil docker image

```bash
docker build -t eas-build .
```

### Exec container

```bash
docker run --rm -it -v "$(pwd):/app" eas-build

# DOCKER WITH LINUX OR IF YOU NEED LIMIT CONTAINER
docker run --rm -it -v "$(pwd):/app" --memory=8g --memory-swap=16g --shm-size=2g eas-build
```

### Inside container

1. Build APK:

```bash
eas build --platform android --profile local --local
```

2. Build AAB (Producción):

```bash
eas build --platform android --profile production --local
```

3. Build APK DEV MODE:

```bash
eas build --profile development --platform android --local
```
