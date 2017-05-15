<img src="http://cs4.pikabu.ru/images/big_size_comm/2015-02_1/14231240052247.png" width="150">

# Helpdesk Bear CRM
A helpdesk interface for SMB to manage tickets, invoices, work orders, staff performance and customer relations. Client-side of the site gives access to support pages to submit tickets. Staff are able to manage tickets submitted by users.


## TODO

change resources to support/ticket/id instead.

### Ticketing
- ticket page to complete
- ticket show to complete
- change date helper to reflect (15 hours ago) (application_helper )
- flags (use icons) [urgent, important, no flag (default) ]
- status [blank (default), in progress, delayed, completed (once completed, clears out of queue and sends to completed page)]
- internal notes section for staff
- clients can only use ticketing system to track their tickets
- clients can leave reviews on service
- reviews are only available after ticket is closed
- once ticket is closed, cannot post any more replies, unless internal notes
- flag 'request manager assistance' for ticket
- last field 'management replied' for any tickets that manager has replied to

### Users
<!-- - users to complete [admin, agents, clients] -->
- add user types: user roles
- add rolify like method manually
- user type specific pages and rights
<!-- - implement full_name method (migration done for table reference) -->
- implement avatarly, migrated

### Dashboard
- implement Dashboard
- graphs and stuff, need more eye candy

### CSS / Design
- change active highlight color to teal
<!-- - add logo to application -->
<!-- - change name -->
- background color
- implement consistent design across app

## BUGS
- when submit ticket from client, redirects to /ticket/id which is only for staff
- everything
- flash/alert outer margin does not apply background color
- seeds crash when adding profile_pic, something devise model
- might need to add table profile pic to user?

## FUTURE FEATURES TO COVER
<!-- - user types -->
- would an activity feed accomplish anything?
<!-- - change name -->
- possibly slack integration for messaging
- implement sorting for tickets

- create a client side controller only for submitting tickets
- 3000/ is landing, has page info
- 3000/support for client side only, submit ticket
- 3000/ticket for staff managing tickets submitted from support


- flags (use icons) [urgent warning, important flag, no flag (default) ]
- status [blank (default), in progress, delayed, completed (once completed, clears out of queue and sends to completed page)]

<i class='red warning sign icon'></i>
<i class='yellow flag icon'></i>

<div class="ui white label">Open</div>
<div class="ui yellow label">In progress</div>
<div class="ui red label">Delayed</div>
<div class="ui grey label">Completed</div>
