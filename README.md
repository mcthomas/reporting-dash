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

- Login (users/*) pages: login, create an account, recover account details

- Home (/) dashboard page: look over assigned business objects 
  → option to log out current user via floating lower-left "LOGOUT" button
  → option to refresh page via universal "Reporting Dash" banner
  
- Listing (/dashboard/manage) page: look over full listing of organization's business objects and use permission-dependent buttons to create business objects, delete business objects, or modify business objects' field attributes
  → option to log out current user via floating lower-left "LOGOUT" button
  → option to refresh page via universal "Reporting Dash" banner
  → permission-dependent option to enter the user administration page (/manage-users) via floating upper-right button 
  
- User Administration (/manage-users) page: look over full listing of organization's users by account name (email) as an admin, and use buttons to edit or delete user objects

- Edit form (/*/*/edit) and create (/*/*/create) form pages: mutate a single object instance's field attributes before persisting them to the db

## Installation

### Dependencies

- if running macOS, install the [brew package manager](https://brew.sh) to streamline the process of installing the below packages: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`


### Setup

## Implementation & Design Details

### Tech Stack

### SDLC - Waterfall

### Architectural Pattern

### User Interface Ideation

### Paradigms

### Design Patterns

### User Authentication & Permissions

### Demo

- [Screen recording of user flows]()

## Ideas for Improvement

## Refinement

- make inaccessible action-linked UI elements invisible or partially transparent for UX clarity
- refactor permission groups to be mutually exclusive for any given user during assignment
  - implement a dropdown for selection instead of traditional form input value attributes
- refine xml field format inputs for elgibility lists such that input files are not asymmetric to the actual lists as they are displayed

## New Functionality

- implement nested form attributes for elgibility lists so that they are not of fixed size
- allow users to rearrange ordering, sizing, and visibility of dashboard objects with drag-and-drop interfacing
- bulk data deletion per object type; e.g., allow user to delete several user reports at once
- bulk data reassignment per object type
