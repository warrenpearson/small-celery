from time import sleep
from celery import Celery
from celery.utils.log import get_task_logger

# Initialize celery
celery = Celery("tasks", broker="redis://127.0.0.1:6379//")

# Create logger - enable to display messages on task logger
celery_log = get_task_logger(__name__)


# Create Order - Run Asynchronously with celery
# Example process of long-running task
@celery.task
def create_order(task_name, value):
    complete_time_per_task = 5

    celery_log.info("Task Starting")
    sleep(complete_time_per_task * int(value))
    celery_log.info("Task Complete!")

    return {"message": f"{task_name} completed!", "value": value}
