# Team Dashboard
I created a Docker image so I could play around with Team Dashboard. See [http://fdietz.github.io/team_dashboard/]()

## Getting Started
This version is a bit rough but it works. You need to:

1. Build the mysql image
2. Build the team-dashboard image
3. Run startup.sh
4. Run a few rake commands to create / populate the database

This starts a Rails server running Team Dashboard on port 3000 of your Docker host. If you're running Boot2Docker on a Mac like me, you can do this:

    open http://$(boot2docker ip):3000