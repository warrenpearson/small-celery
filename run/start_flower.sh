#!/bin/bash

source venv/bin/activate

celery -A my_tasks.celery flower > logs/flower.log 2>&1 &
