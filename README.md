SA-POSTGRES
===========

[![Build Status](https://travis-ci.org/softasap/sa-postgres.svg?branch=master)](https://travis-ci.org/softasap/sa-postgres)

Possible overrides:

```

  option_create_app_user: false

  postgresql_version: 9.4

  postgresql_listen_addresses: localhost  # * for any address

  postgresql_port: 5432

  # Set remotely to allow listening
  #postgres_app_network: "192.168.0.1/32"
  #postgres_app_network_regex: "192\.168\.0\.1\/32"

  # Set remotely to allow listening
  #postgres_dev_network: "192.168.0.1/32"
  #postgres_dev_network_regex: "192\.168\.0\.1\/32"

  db_host: localhost
  db_user: app_user
  db_password: app_password
  db_name: app_database

```

Example of use: [https://github.com/Voronenko/devops-ruby-app-demo](https://github.com/Voronenko/devops-ruby-app-demo)

Simple:

```


     - {
         role: "sa-postgres"
       }

```


Advanced:

```


     - {
         role: "sa-postgres",
         
         postgresql_listen_addresses: 127.0.0.1,
         
         db_host: localhost,
         db_user: app_user,
         db_password: app_password,
         db_name: app_database,         
         
         postgres_app_network: "192.168.0.1/32",
         postgres_app_network_regex: "192\.168\.0\.1\/32",


         postgres_dev_network: "192.168.0.1/32",
         postgres_dev_network_regex: "192\.168\.0\.1\/32"

       }

```


# Misc hints

If you ever wanted to connect remotely using user postgres, you need first to set password for it:

```
sudo -u postgres psql postgres

# \password postgres

Enter new password:
```


In psql usual commands:

```

\l show databases

```

Importing database from sql file

Importing DB

```
psql -d demo_test -f demo.sql
```

Generate pgsql schema diagram with schemacrawler  http://sualeh.github.io/SchemaCrawler/

```

schemacrawler -server=postgresql -database=demo_test -user=postgres -password=postgres -infolevel=maximum -command=graph -outputformat=pdf -outputfile=database-diagram.pdf

```

Generate pgsql schema diagram portal with schemaspy http://schemaspy.sourceforge.net/

```
schemaspy -t pgsql -db demo_test -host localhost -port 5432 -s public -u postgres -p postgres  -o output
```
