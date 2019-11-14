set -e
cd "$(dirname "$0")"

/bin/server -alsologtostderr
