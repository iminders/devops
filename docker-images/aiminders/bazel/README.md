### build image
```
cd dockerfiles/aiminders/bazel/
docker build -f 0.9.0.Dockerfile -t aiminders/libary:bazel.0.9.0 .
```

### push to docker hub

```
docker push aiminders/libary:bazel.0.9.0
```
