#!/bin/bash

curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"args": ["test", 2] }' \
  http://localhost:5555/api/task/async-apply/worker.create_order
