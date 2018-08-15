set -e
cd "$(dirname "$0")"

/bin/server  \
       -port=$PORT \
       -alsologtostderr
