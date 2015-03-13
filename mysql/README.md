To create the container, just provide a dummy command (`nop`). You can't run this container anyway since it's based on `scratch`.

For example, to create a Data Volume Container for your MySQL container, do this:

    docker create -v /var/lib/mysql --name mysql-data dynamind/data-only nop

Then, to use it in a MySQL container, mount it like this:

    docker run --volumes-from mysql-data -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=changeit --name mysql dynamind/mysql

