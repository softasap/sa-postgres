SA-POSTGRES
===========

[![Build Status](https://travis-ci.org/softasap/sa-postgres.svg?branch=master)](https://travis-ci.org/softasap/sa-postgres)

Possible overrides:

<pre>

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

</pre>

Example of use: [https://github.com/Voronenko/devops-ruby-app-demo](https://github.com/Voronenko/devops-ruby-app-demo)

Simple:

<pre>


     - {
         role: "sa-postgres"
       }

</pre>


Advanced:

<pre>


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

</pre>
