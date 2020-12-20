# Build and run example

```
docker build --tag=symfony-docs-builder .

docker run --rm -v "${PWD}/output:/output" symfony-docs-builder
```
