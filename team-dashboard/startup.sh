docker run -d --name mysql mysql 
echo You need to Run some commands inside the container to create the database (see Dockerfile):
echo rake db:create && rake db:migrate && rake populate && rails s
docker run -it --rm -p 3000:3000 --link mysql:mysql team-dashboard /bin/bash