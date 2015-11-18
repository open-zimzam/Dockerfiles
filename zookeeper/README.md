To start, run:

    docker build -t dynamind/zookeeper .
    docker run -it --name zkdemo dynamind/zookeeper

Then to connect as a client, run (from a different terminal):

    docker exec -it zkdemo /usr/share/zookeeper/bin/zkCli.sh -server localhost:2181

To exit the client, type `quit`