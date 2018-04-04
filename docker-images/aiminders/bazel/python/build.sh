echo "Building"
docker build -f Dockerfile -t aiminders/library:bazel.latest .
echo "Pushing"
docker push aiminders/library:python.latest
