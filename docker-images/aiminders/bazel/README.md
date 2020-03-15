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

### push to aliyun
```
# docker login --username=liuwen.yzu@gmail.com registry.cn-hangzhou.aliyuncs.com
docker tag aiminders/library:bazel.latest registry.cn-hangzhou.aliyuncs.com/aiminders/library:bazel.latest
docker push registry.cn-hangzhou.aliyuncs.com/aiminders/library:bazel.latest
```
