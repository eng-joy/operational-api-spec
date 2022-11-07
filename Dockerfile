FROM node:17.5.0-alpine as api-docs-builder
RUN npm i -g redoc-cli
COPY api/docs/openapi.yaml /usr/app/api/docs/openapi.yaml
RUN redoc-cli bundle /usr/app/api/docs/openapi.yaml -o /usr/app/api/docs/generated-docs.html

FROM python:3.10.5-alpine
RUN apk update && apk add build-base python3-dev linux-headers
WORKDIR /usr/app
COPY --from=api-docs-builder /usr/app/api/docs/generated-docs.html api/docs/generated-docs.html
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
