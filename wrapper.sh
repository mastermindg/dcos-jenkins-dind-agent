#!/bin/bash
set -e

echo "==> Launching the Docker daemon..."
dind dockerd --storage-driver=overlay --insecure-registry registry.marathon.l4lb.thisdcos.directory:5000 &

while(! docker info > /dev/null 2>&1); do
    echo "==> Waiting for the Docker daemon to come online..."
    sleep 1
done
echo "==> Docker Daemon is up and running!"

/bin/sh -c "$@"
