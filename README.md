# README

Ruby on Rails Application for Wineries to Improve Sales by co-creating regional Sales Figures and Graphs

* **The [todo list](design/TODO.md) and roadmap is in the design folder**

## Requirements
* Ubuntu 14 or greater

* Running Passenger and Nginx Web-Servers

* Ruby version 2.3.1

* Rails version 5.0.0

* Database is using Postgresql

* Install ImageMagick

## Install

* clone this Repo into the App Directory

* Copy over the env.yml into the App Directory in config/

* In Production Create the psql Database user "winery" and set your password

* run whenever -w (to write the chrontabs for the email reminders & ...) (not yet implemented)


## Backup the DataBase DB DUMP
* From the server in the App Directory run

`sudo -u postgres pg_dump --oids --no-owner -Fc --disable-triggers --clean -f data.dump winery`

* This will generate a data.dmp file.
* Download the data.dmp file for backup for import into your dev environment

## Restore the DB from a dump file
* in the App Directory run

`pg_restore --clean --no-owner -d winery data.dump`


# The Data Models
## Models associated with storing the sales data
### The heavy lifting for crunching that data is all in
### sales_summary.rb model file and region.rb model file

* ### Wineries
  * Describes a winery
  * Has many TastingRooms
* ### TastingRooms
  * Has many SalesSummaries
  * Belongs to a Region
* ### SalesSummaries
  * The Winery's Monthly Sales Data is stored here.
  * Entry per month
  * The Model File has the functions for calculating the fields not stored in the DB.
    * i.e. "Percent_tasters_purcahased"
* ### Regions
  * Belongs to a County
  * The model file has the methods for calculating the region averages

## The other Models
* Counties
* Users
* WineryUsers
    Describes which user belongs to which winery


## Session
The session controller creates login and logout.
The Session Helper has functions for keeping the user active in the session after login.
