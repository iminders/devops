### build image
```
cd dockerfiles/aiminders/bazel/
docker build -f latest.Dockerfile -t aiminders/library:bazel.latest .
```

### push to docker hub

```
docker push aiminders/library:bazel.latest
```
