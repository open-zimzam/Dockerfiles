# Clone this repository and build the Oracle JDK 8 and the Tomcat 8 image
    git clone https://github.com/open-zimzam/Dockerfiles.git
    docker build -t oracle-jdk-8 Dockerfiles/oracle-jdk-8
    docker build -t tomcat-8 Dockerfiles/tomcat-8

# Run the container
    docker run --name tomcat-8 -d -p 8080:8080 tomcat-8

# If you're using Boot2Docker on a Mac
    open http://$(boot2docker ip):8080
    
# Tomcat Manager credentials
Username: **tomcat**, password: **tomcat**