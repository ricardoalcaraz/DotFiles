apt-get update && apt-get install sysbench && sysbench --threads=4 cpu run
docker run -it --rm --cpuset-cpus=0-3 jess/stress --cpu 100