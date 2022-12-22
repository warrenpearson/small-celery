## small-celery

### Install dependency

```bash
brew install redis
brew services start redis
```

### Create environment

```bash
make_env.sh
```

### Start flower

```bash
./run/start_flower.sh
```

### Start a worker
```bash
./run/start_worker.sh
```

### Submit a task

```bash
./run/submit_task.sh

{"task-id": "9ba038e9-2e2c-4293-8997-3ce3af732bab"}
```

### Check task status

```bash
./run/task_status.sh 9ba038e9-2e2c-4293-8997-3ce3af732bab

{"uuid": "9ba038e9-2e2c-4293-8997-3ce3af732bab", 
"name": "worker.create_order", "state": "SUCCESS", 
"received": 1671721796.2874188, "sent": null, 
"started": 1671721796.289553, "rejected": null, 
"succeeded": 1671721806.295249, "failed": null, 
"retried": null, "revoked": null, "args": "['test', 
2]", "kwargs": "{}", "eta": null, "expires": null, 
"retries": 0, "worker": "celery@Warrens-MacBook-Pro-2.local", 
"result": "{'message': 'test completed!', 'value': 2}", 
"exception": null, "timestamp": 1671721806.295249, 
"runtime": 10.003924863001885, "traceback": null, 
"exchange": null, "routing_key": null, "clock": 118, 
"client": null, "root": "9ba038e9-2e2c-4293-8997-3ce3af732bab", 
"root_id": "9ba038e9-2e2c-4293-8997-3ce3af732bab", 
"parent": null, "parent_id": null, "children": []}
```

### Check queue

```bash
./run/check_queue.sh

{
 "3076c585-c3ee-40d1-8df0-5310f664b508": 
    {"uuid": "3076c585-c3ee-40d1-8df0-5310f664b508", 
     "name": "worker.create_order", 
     "state": "STARTED", "received": 1671721993.7561228, 
     "sent": null, "started": 1671721993.757449, "rejected": null, 
     "succeeded": null, "failed": null, "retried": null, 
     "revoked": null, "args": "['test', 2]", "kwargs": "{}", "eta": null, 
     "expires": null, "retries": 0, "result": null, "exception": null, 
     "timestamp": 1671721993.757449, "runtime": null, 
     "traceback": null, "exchange": null, "routing_key": null, "clock": 344, 
     "client": null, "root": "3076c585-c3ee-40d1-8df0-5310f664b508", 
     "root_id": "3076c585-c3ee-40d1-8df0-5310f664b508", "parent": null, 
     "parent_id": null, "children": [], 
     "worker": "celery@Warrens-MacBook-Pro-2.local"}, 
     
 "9ba038e9-2e2c-4293-8997-3ce3af732bab": {
     "uuid": "9ba038e9-2e2c-4293-8997-3ce3af732bab", 
     "name": "worker.create_order", 
     "state": "SUCCESS", "received": 1671721796.2874188, 
     "sent": null, "started": 1671721796.289553, "rejected": null, 
     "succeeded": 1671721806.295249, "failed": null, "retried": null, 
     "revoked": null, "args": "['test', 2]", "kwargs": "{}", "eta": null, 
     "expires": null, "retries": 0, "result": 
     "{'message': 'test completed!', 'value': 2}", "exception": null, 
     "timestamp": 1671721806.295249, "runtime": 10.003924863001885, 
     "traceback": null, "exchange": null, "routing_key": null, "clock": 118, 
     "client": null, "root": "9ba038e9-2e2c-4293-8997-3ce3af732bab", 
     "root_id": "9ba038e9-2e2c-4293-8997-3ce3af732bab", "parent": null, 
     "parent_id": null, "children": [], 
     "worker": "celery@Warrens-MacBook-Pro-2.local"}
 }
```