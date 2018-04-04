echo "Building"
docker build -f Dockerfile -t aiminders/library:python.latest .
echo "Pushing"
docker push aiminders/library:python.latest
