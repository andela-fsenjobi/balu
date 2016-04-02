#BALUU
[![Circle CI](https://circleci.com/gh/andela-fsenjobi/baluu.svg?style=svg)](https://circleci.com/gh/andela-fsenjobi/baluu)
[![Coverage Status](https://coveralls.io/repos/github/andela-fsenjobi/baluu/badge.svg?branch=master)](https://coveralls.io/github/andela-fsenjobi/baluu?branch=master)
[![Code Climate](https://codeclimate.com/github/andela-fsenjobi/baluu/badges/gpa.svg)](https://codeclimate.com/github/andela-fsenjobi/baluu)

Baluu is a flight reservation application built with Ruby on Rails. It would be a great tool for agencies and individuals to search for available flights to and from specified locations, make reservations and manage their reservations.

##Getting Started
* Clone the application with ```git clone git https://github.com/andela-fsenjobi/baluu.git```
* Navigate into the the `baluu` folder and run `bundle`
* Migrate the database with `rake db:migrate` (Also run `rake db:seed` if you want to use the seed data.)
* Run `rails s` and visit `http://localhost:3000` on your browser to use the app

##Dependencies
The app requires version `Ruby v2.2.3`. Other dependencies would be installed on running `bundle`

##Testing
The application comes with a spec folder. Simply run `rspec` on your console to run a test. The test dependencies would have been installed along with the app when you ran `bundle`.

##Application Features
###Search Flight
On the home page a number of flights are displayed by default. If your desired flights doesn't appear by default, you may run a search with the search form on the same page. This form returns flights that meet your search requirements. You may them proceed to book.
###Book Flights
When you have seen your desired flight, you may proceed to book the flight. Click on the `Book Flight` button just below the flight. It then takes you to a page where you see more details about the flight. You may proceed to add your name on the passenger form. You can book for multiple passengers.
###Manage Booked Flights
Whether a user is registered or not, they would be able to make flight reservations. Also, non-registered suers can modify details of their flight by simply typing the reference number of their booking in the form provided on the navigation bar of the application. On clicking `Manage Booking`, the page to view and manage the flight is rendered.
###See all Bookings
For registered user, they can view all bookings and modify details of the bookings provided the departure date is still ahead.

##Limitations
The application is unable to process payments yet.

##Live Demonstration
[View App on Heroku](https://baluu-staging.herokuapp.com)
##Contributions
You may make modifications and improvements on the application with the following procedures

* Fork the repository
* Make your additions
* Create a pull request

The modifications will be reviewed and merged if necessary. Properly tested modifications will be given priority
