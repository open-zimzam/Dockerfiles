FROM centos:7

USER root

RUN yum -y install git gcc gcc-c++ make ruby ruby-devel zlib-devel libxslt-devel libxml2-devel mysql-devel
RUN useradd td

USER td

COPY database.yml /tmp/

# Instructions from: http://fdietz.github.io/team_dashboard/

RUN cd ~ &&\
    git clone git://github.com/fdietz/team_dashboard.git &&\
    cd team_dashboard &&\
    gem install bundler

WORKDIR /home/td/team_dashboard

ENV PATH ~/bin:$PATH

RUN cd ~/team_dashboard &&\
    bundle install
    
RUN cp /tmp/database.yml ~/team_dashboard/config &&\
    ls -ltr ~/team_dashboard/config

# After starting up the instance, run the following commands to create a database:
# rake db:create && rake db:migrate && rake populate 

# Then, to start the server:
# rails s

EXPOSE 3000