## README

Ruby on Rails Application for Wineries to Improve Sales by co-creating regional Sales Figures and Graphs

* **The [todo list](design/TODO.md) and roadmap is in the design folder**

* Ruby version 2.3.1

* Rails version 5.0.0RC1

* Database is using Postgresql

* Install ImageMagick

* Copy over the env.yml into the folder config/

* In Production Create the psql Database user "winery-sales" and set the password

* run whenever -w (to write the chrontabs for the email reminders & ...)

## Backup the DataBase DB DUMP
* From the server in the App Directory run

`sudo -u postgres pg_dump --oids --no-owner -Fc --disable-triggers --clean -f data.dump winery`

* This will generate a data.dmp file.
* Download the data.dmp file for backup for import into your dev environment

## Restore the DB from a dump file
* in the App Directory run

`pg_restore --clean --no-owner -d winery data.dump`
