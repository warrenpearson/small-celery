#!/bin/bash

curl -i -w "\n" --header "Content-Type: application/json" \
  --request POST \
  --data '{"args": ["test", 2] }' \
  http://localhost:5555/api/task/async-apply/my_tasks.create_order
