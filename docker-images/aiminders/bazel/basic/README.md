### Build mpi image
```
docker build -f latest-mpi.Dockerfile -t aiminders/library:mpi.latest .
docker push aiminders/library:mpi.latest
```

### push to aliyun
```
# docker login --username=liuwen.yzu@gmail.com registry.cn-hangzhou.aliyuncs.com
docker tag aiminders/library:mpi.latest registry.cn-hangzhou.aliyuncs.com/aiminders/library:mpi.latest
docker push registry.cn-hangzhou.aliyuncs.com/aiminders/library:mpi.latest
```
