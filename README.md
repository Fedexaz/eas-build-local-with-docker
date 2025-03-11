## Ejecutar docker

```bash
npx expo start
```

## ABRIR HOST PARA APIS LOCAL

```bash
lt --port 8000 --subdomain simple-api

lt --port 3000 --subdomain simple-socket-server
```

### Buildear imagen docker

```bash
docker build -t eas-build .
```

### Ejecuta el contenedor

```bash
docker run --rm -it -v "$(pwd):/app" eas-build
# DOCKER WITH LINUX OR IF YOU NEED LIMIT CONTAINER
docker run --rm -it -v "$(pwd):/app" --memory=8g --memory-swap=16g --shm-size=2g eas-build
```

### Dentro del contenedor

1. Instala las dependencias de tu proyecto:

```bash
yarn install
eas build:configure
```

2. Compila el APK:

```bash
eas build --platform android --profile local --local
```

3. Compila el AAB (Producción):

```bash
eas build --platform android --profile production --local
```

4. Compila el APK DEV MODE:

```bash
eas build --profile development --platform android --local
```
