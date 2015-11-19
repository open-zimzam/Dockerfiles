# Getting started
    git clone https://github.com/open-zimzam/Dockerfiles.git
    docker build -t tomcat-9 Dockerfiles/tomcat-9

## Run the container
    docker run --name tomcat-9 -d -p 8080:8080 tomcat-9
    open http://<dockerhost ip>:8080

### Tomcat Manager credentials
Username: **tomcat**, password: **tomcat**