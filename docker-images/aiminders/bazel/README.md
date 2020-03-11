### build image
```
cd dockerfiles/aiminders/bazel/
make build
```

### build gpu image
```
cd dockerfiles/aiminders/bazel/
make build-gpu
```

### push to docker hub

```
docker push aiminders/library:bazel.latest
```
