# iexpert

<!-- Base dashboard. -->

Version Flutter [3.3.10](https://nodejs.org/).

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Building for source.

It is recommended to generate an .apk with the following command then access:

> Note: `build/app/outputs/flutter-apk`.

```sh
flutter build apk --split-per-abi
```

## include environment variables.

> Note: `PROTOCOL`: if your domain does not have an ssl certificate, you can force queries to be made with the protocol: `http` or `https`.

### For development debug: .env.development

#### Only include your domain without the "https://" or "https://" prefix

> Note: `DEBUG`: by default it will be `true`, which will always make requests with `https` protocol, You can also connect to the production domain by changing `DEBUG` to "false" and providing the environment variable `API_URL_PRODUCTION`, following the prefix recommendations.

```sh
API_URL='localhost:4000'
API_URL_PRODUCTION='localhost:4000'
PROTOCOL='http'
DEBUG='true'
```

### For production release: .env.production

#### Only include your domain without the "https://" or "https://" prefix

> Note: DEBUG: by default it will be "true", which will always make requests with `API_URL`.

```sh
API_URL='localhost:4000'
PROTOCOL='http'
```

For production release web:

```sh
flutter build web

```

o

```sh
flutter build web --base-href "/"
```

## Access the project path and copy the contents of the web folder

> Note: `build/web`.
