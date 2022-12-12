<img src="rd-logo.png" width="200"/>

# Reporting Dashboard

Reporting Dashboard is a relatively simple [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) Ruby on Rails application I developed as part of a one-week solo project to explore the Rails framework, PostgreSQL database management, user authentication, and other topics in web development. 

## Requirements

### User Stories

Business entities → Channel Plans, User Reports, Elgibility Lists

New User

- __As a__ new user, __I want to__ have the ability to create my own user account within the application using my email address, __so that__ I can gain access to its functions including its pages, views, and business entity data.
- __As a__ user, __I want to__ have the ability to recover and change my password within the application, __so that__ I can recover my user account.
- __As a__ new user, __I want to__ automatically assigned to the *associate* user role, __so that__ I can gain basic read access to the application.

Associate User

- __As an__ *associate* role user, __I want to__ have *read* access to an aggregated view of all business objects assigned to me on my dashboard screen, __so that__ I can easily look over the documents that are intended for me to see.
- __As an__ *associate* role user, __I want to__ have *read* access to the listing screen of all business objects per entity type and who they are assigned to, __so that__ I have a condensed view of all our organization's documents.

Lead User

- __As a__ *lead* lower admin role user, __I want to__ have *read* access to an aggregated view of all business objects assigned to me on my dashboard screen, __so that__ I can easily look over the documents that are intended for me to see.
- __As a__ *lead* lower admin role user, __I want to__ have *read* access to the listing screen of all business objects per entity type and who they are assigned to, __so that__ I have a condensed view of all our organization's documents.
- __As a__ *lead* lower admin role user, __I want to__ have *edit* write access to the listing screen, __so that__ I can mutate the field attributes of the business objects in order to update them, including reassigning business objects entirely.

Admin User

- __As an__ *admin* role user, __I want to__ have *read* access to an aggregated view of all business objects assigned to me on my dashboard screen, __so that__ I can easily look over the documents that are intended for me to see.
- __As an__ *admin* role user, __I want to__ have *read* access to the listing screen of all business objects per entity type and who they are assigned to, __so that__ I have a condensed view of all our organization's documents.
- __As an__ *admin* role user, __I want to__ have *edit* write access to the listing screen, __so that__ I can mutate the field attributes of the business objects in order to update them, including reassigning business objects entirely.
- __As an__ *admin* role user, __I want to__ have *create* write access to the listing screen, __so that__ I can create new business objects, including via the option to upload elgibility lists as .CSV files, and mutate the business objects' field attributes, including their assignment values.
- __As an__ *admin* role user, __I want to__ have *delete* write access to the listing screen, __so that__ I can delete existing business objects from the organization's database.
- __As an__ *admin* role user, __I want to__ have the ability to manage user permission group assignments, __so that__ I can control which existing users have which access rights to the organization's business objects, by mutating the permission group field attributes per user.

### Usage Flow

- Login (users/*) pages: hyperlinks to login, create an account, recover account details 

- Home (/) dashboard page: look over assigned business objects 
  
  → option to log out current user via floating lower-left "LOGOUT" button
  
  → option to refresh page via universal "Reporting Dashboard" banner
  
  → option to view the listing page via floating upper-right button
  
- Listing (/dashboard/manage) page: look over full listing of organization's business objects and use permission-dependent buttons to create business objects, delete business objects, or modify business objects' field attributes

  → option to log out current user via floating lower-left "LOGOUT" button

  → option to return to the home dashboard via universal "Reporting Dashboard" banner
  
  → permission-dependent option to edit a business object instance via individual "EDIT" buttons 
  
  → permission-dependent option to delete a business object instance via individual "DELETE" buttons 
  
  → permission-dependent option to create a business object instance via individual "+" buttons
  
  → permission-dependent option to upload a new elgibility list instance via lower "Choose File" and "IMPORT ELGIBILITY LIST(S)" buttons
  
  → permission-dependent option to enter the user administration page (/manage-users) via floating upper-right button 
  
- User Administration (/manage-users) page: look over full listing of organization's users by account name (email) as an admin user, and use buttons to edit or delete user objects

  → option to log out current user via floating lower-left "LOGOUT" button

  → option to return to the home dashboard page via universal "Reporting Dashboard" banner
  
  → option to return to the listing page via floating upper-right button
  
  → option to edit a business object instance via individual "EDIT" buttons 
  
  → option to delete a business object instance via individual "DELETE" buttons 

- Edit form (/\*/\*/edit) and create (/\*/\*/create) form pages: mutate a single object instance's field attributes before persisting them to the database

  → option to log out current user via floating lower-left "LOGOUT" button

  → option to return to the home dashboard page via universal "Reporting Dashboard" banner
  
  → option to return to the listing page via floating upper-right button
  
  → field attribute inputs for the given business object instance
  
  → option to save changes to the current business object instance via lower "SAVE *" button

## Installation

### Dependencies

- install [Docker Desktop](https://docs.docker.com/engine/install/) for your platform

### Setup

- launch Docker so that it is running
- from your terminal emulator:
  - Clone this repository, and stay on the release branch: `git clone git@github.com:mcthomas/reporting-dash.git`
  - Build a container environment with all system and project dependencies required to serve the app: `docker compose build`
  - Create the database inside the container: `docker-compose run web rake db:create`
  - Run the database migrations inside the container: `docker-compose run web rake db:migrate` 
  - Start the containerized rails server (may take about 10-15 seconds): `docker compose up`
- access the application: http://localhost:3000
- create a new account that you will use as an admin user
- close the browser tab after you've logged in once successfully with the new account
- from your terminal emulator window that is running the server from the previous command:
  - stop the server: CTRL-C 
  - enter the rails console inside of the container: `docker-compose run web rails console`
  - assign the new account to the admin group, since no existing admin account exists to elevate it: 
    - `@user = User.first`
    - `@user.associate = false`
    - `@user.admin = true`
    - `@user.save`
    - `exit`
- start the rails server again: `docker compose up`
- access the application: http://localhost:3000

*Now you can logout, create new accounts, switch between them, and know that your admin account which you created first has the ability to elevate any other accounts you create.  Unless you demote all accounts below the admin group.*

## Implementation & Design Details

### Tech Stack

- Framework: Ruby on Rails
  - Frontend: HTML/JavaScript/CSS
  - Backend: Ruby/PostgreSQL

### SDLC - Waterfall

- Given the minimal risk of changing requirements, a highly-structured approach was the best fit for such a short development cycle
- Each task was planned as an individual deliverable, and they were completed in a logical sequence
- earlier phases were broken into entity-creation tasks, with later phases including implementing user login authentication

### Architectural Pattern

- [Model-view-controller](https://en.wikipedia.org/wiki/Model–view–controller)
  - every entity type is a model, and therefore has its own table in the database: Users, Channel Plans, User Reports, Elgibility Lists 
  - the controllers intake server requests and dictate which html files to render, based on the base uri prefix in the url.  For example, for /channelplans/new the application point to the server-side channelplans.rb controller, and look for the action "new", exposed by routing, for views to render or for code to execute, which may include querying the channelplan.rb model (or other models) for reading or mutating data
  - the html.erb view files are composed of and decorated by our frontend languages, and they expose our data and layout the page for the end user
  
### User Interface Ideation

- fully-universal nav buttons/links, such as the "LOGOUT" button and the "Reporting Dashboard" banner, keep interfacing consistent
- partially-universal nav buttons, such as the list icon button, are available when you need them and maintain placement even as different contexts cause them to swap with, e.g., the user admin page button 
- css colors are assigned at random from a set pool to stylize the dashboard documents, to make them easy to differentiate
- basic form template views are used for consistency and easy data input for creating and editing entity instances
- Materialize CSS is used for consistent asset appearance and to streamline the process of building this prototype

### Paradigms

- model programming is largely object-oriented, as is intended for a language like Ruby, for the sake of conceptualizing how the entities will be instantiated by the users, and for encapsulating controller methods that demand some separation for their interfacing with the models' data fields
- much of the public controller logic is functional (declarative) in dictating access rights and for redirecting users based on their actions
- javascript embedded within the html.erb files varies from functional computing in iterating through data, to mainly event-driven logic for exposing model attributes to the end user 

### Design Patterns

- creational patterns are used in the backend among controller/model interfacing

### User Authentication & Permissions

- implemented with [Devise](https://github.com/heartcombo/devise) for simple and scalable integration with the MVC architecture, having multiple tiers of of auth (e.g. basic, token-based) for secure logins as appropriate for activating in different environements

*Password resetting in localhost is not enabled*

### Demo

- [Screen recording of user flows, including .csv import for elgibility lists]()

## Ideas for Improvement

### Refinement

- make inaccessible action-linked UI elements invisible or partially transparent for UX clarity
- refactor permission groups to be mutually exclusive for any given user during assignment
  - implement a dropdown for selection instead of traditional form input value attributes
- refine xml field format inputs for elgibility lists such that input files are not asymmetric to the actual lists as they are displayed
- display username near logout button

### New Functionality

- implement nested form attributes for elgibility lists so that they are not of fixed size
- allow users to rearrange ordering, sizing, and visibility of dashboard objects with drag-and-drop interfacing
- bulk data deletion per object type; e.g., allow user to delete several user reports at once
- bulk data reassignment per object type
