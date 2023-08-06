## small-celery

### Install

#### install and start redis
```bash
brew install redis
brew services start redis
```

#### create environment

```bash
make_env.sh
```

### Startup and shutdown

#### start flower

```bash
./run/start_flower.sh
```

Logs go in `logs/`. Port is `5555`.

#### stop flower

```bash
./run/stop_flower.sh
```

Just a simple kill against the matching flower process.

#### start a worker
```bash
./run/start_worker.sh <num>
```

`<num>` is required to give each worker a unique name.

#### submit a task

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

### Understanding how celery works

You can start a flower with no running workers, it won't mind.

The name of the file containing your celery tasks is _really_ important, as it is referenced in the startup commands for both flower and the workers. The file is called `my_tasks.py` specifically to make that more obvious.

```
127.0.0.1:6379> smembers "_kombu.binding.celery.pidbox"
```

returns a list of running workers.

### Questions

Where does Flower store state?

Why does redis seem so sparse?


