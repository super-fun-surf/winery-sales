# TODO

* ~~create new Winery-Sales application framework~~
* setup app basics. gems and database
* ~~create github repository and upload to github~~
* ~~Users~~
* ~~Wineries~~
* ~~Sales~~
* make a way of reporting the missing sales months for the tasting rooms
* winery profile sidebar Partial
  * for incorporation into individual month sales summaries
  

## Phase 1
* #### Winery
 * Model
    1. name **string**    
    1. year established **number**
    1. number of employees **number**
    1. image **refile attachment**    
    1. array of dates for reminder emails **pg array or json**
 * Controller
 * View
    * Profile => (The Main View when logged in)

 * #### Tasting room
  * Model
    1. name
    1. winery **belongs_to**
    1. region **reference**
    1. year established **number**
    1. number of employees **number**
    1. image **refile attachment** use the winery if not present
    1. estate **boolean**

* #### Sales Summary
  * Model
     1. tasting_room **belongs_to**
     1. number of tasters **number**
     1. number of purchasers **number**
     1. number of club signups **number**
     1. sales_in_dollars **floating point**
     1. year **number**
     1. month **nunber** could be nill     
     1. day **number** could be nill.

     1. **not to start** was this an event or not **boolean**     
     1. **not to start** start date **datetime** could be nill if using monthly entry
     1. **not to start** end date **datetime** could be nill if event or monthly entry     
  * Controller
  * View

* #### User Accounts
  * name
  * email
  * password
  * has many wineries through winery_users **CHANGE**
  * picture **refile attachment**  
  * permissions **number**
    * Guest 0
    * User 3
    * Admin 10
    * Root 11
  1. #### Actions for the Users
    1. Agree to terms
    1. email a login link.
    1. email a password reset
    1. email a verification
    1. Create a Winery
    1. Join a winery **with Approval automated**

* #### Winery-Users
  * reference winery
  * reference user
  * permissions level **number**

* #### Administrator Models & Resources
  * County
      1. ~~name **string**~~
      1. ~~population **number**~~
      1. profile_image **refile attachment**
  * Region
      1. name **string**
      1. belongs_to: county
      1. image **refile attachment**
  * Email reminders

## Phase 2
* #### Tracking
  * user login
    * user id
    * created_at **datetime**
    * last access
    * last page time

  ---

### Design Screens

![nameofimage](screens/Graph.png)

![donkeys](screens/Monthly Show.png)

![donkeys](screens/Monthly.png)
