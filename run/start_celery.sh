#!/bin/bash

source env/bin/activate

celery -A worker.celery worker --loglevel=info
