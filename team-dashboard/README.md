# Team Dashboard
I created a Docker image so I could play around with Team Dashboard. See [http://fdietz.github.io/team_dashboard/]()

## Getting Started
This version is a bit rough but it works. You need to:

Clone this repo

    git clone https://github.com/open-zimzam/Dockerfiles.git

Build and run the mysql image

    docker build -t mysql Dockerfiles/mysql
    docker run -d --name mysql mysql

Build and run the team-dashboard image (takes a few minutes)

    docker build -t team-dashboard Dockerfiles/team-dashboard
    docker run -it --name team-dashboard -p 3000:3000 --link mysql:mysql team-dashboard /bin/bash

Inside the image, run these rails commands:

    rake db:create && rake db:migrate && rake populate && rails s

This creates and populates the database and starts a Rails server running Team Dashboard on port 3000 of your Docker host. 

If you're running Boot2Docker on a Mac like me, you can do this from your Mac terminal:

    open http://$(boot2docker ip):3000