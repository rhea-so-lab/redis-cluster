#!/bin/bash

docker-compose up -d

docker exec redis-cluster-entry /bin/sh -c "echo yes > in.txt && /data/redis-trib.rb create --replicas 1 127.0.0.1:20000 127.0.0.1:20001 127.0.0.1:20002 127.0.0.1:20003 127.0.0.1:20004 127.0.0.1:20005 < in.txt"

echo "Redis cluster started, try: \"redis-cli -c -p 20000 \""
