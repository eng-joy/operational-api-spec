# operational-api-spec

This repository demonstrates the following engineering flow for API creation:

1. Define endpoints in OpenAPI spec
2. Generate contract tests from spec
3. Execute generated tests against built image

## Running contract tests locally

TBD

```shell
python manage.py runserver
docker run -v $PWD/api/docs:/api -w /api apiaryio/dredd dredd openapi.yaml http://host.docker.internal:8000
```