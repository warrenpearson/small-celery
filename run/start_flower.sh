#!/bin/bash

source venv/bin/activate

FLOWER_UNAUTHENTICATED_API=1 celery -A my_tasks.celery flower > logs/flower.log 2>&1 &
