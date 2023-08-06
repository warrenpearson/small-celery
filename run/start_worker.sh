#!/bin/bash

source venv/bin/activate

celery -A my_tasks.celery worker -n $1 --loglevel=info
