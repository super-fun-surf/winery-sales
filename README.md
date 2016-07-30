# Winery Sales

Ruby on Rails Application for Wineries to Improve Sales by co-creating regional Sales Figures and Graphs

* **The [todo list](design/TODO.md) and roadmap is in the design folder**

## Requirements
* Ubuntu 14+

* Passenger v5.0.28 and Passenger Nginx module

* Ruby version 2.3.1

* Rails version 5.0.0

* [PostgreSQL](https://www.postgresql.org/) v9.4.7

* [ImageMagick](https://github.com/ImageMagick/ImageMagick)

## Install
1. Clone Winery Sales into App directory
2. Copy env.yml into [config/](config) inside of App directory
3. Install PostgreSQL `sudo apt install postgresql` and ImageMagick `sudo apt-get install imagemagick`
4. Create production psql database with the user *winery* and set password
5. run whenever -w (to write the chrontabs for the email reminders & ...) (not yet implemented)


## Backup the DataBase / DB DUMP
* From the server in the App Directory run

`sudo -u postgres pg_dump --oids --no-owner -Fc --disable-triggers --clean -f data.dump winery`

* This will generate a data.dump file.
* Download the data.dump file for backup for import into your dev environment

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
  * sales summaries are the main benchmark data.
  * The Winery's Monthly Sales Data is stored here.
  * Entry per month
  * The Model File has the functions for calculating the fields of the benchmark not stored in the DB.
    * i.e. "percent_tasters_purcahased"
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

## Mailer
* All mail is sent using the MailGun API
* The mailer view is located in the views folder in user_email/
* The view is rendered via render_to_string inside of "send_user_activation_mail" function located in controllers/concerns/user_mailgun.rb
