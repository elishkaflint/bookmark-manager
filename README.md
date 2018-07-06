# Bookmark Manager

___

## Summary

Week 4 Makers Academy in-week project to develop a web-based bookmark manager.</br>
[Full instructions and user stories here.](https://github.com/makersacademy/course/blob/master/bookmark_manager/00_challenge_map.md)
___

## Credits

Developed by Elishka Flint, aided by Layth Al-Qattan, Nabil Far and Yvonne Tang during pair programming sessions.
___

## Learning Outcomes

### Topics Covered

* Web applications using databases (including one-to-many and many-to-many relationships)
* RESTful routes
* The MVC model
* Test-Driven Development using Rspec and Capybara
* Object-Oriented Programming
  - classes, methods, scope, instance variables
  - ensuring code is DRY
  - using Single Responsibility Principle

### Personal Reflection

It's been an intense week - challenging due to the step up in project complexity but very enjoyable because we are now implementing full stack features with minimal guidance from the project instructions.

I have made good progress and feel I achieved this week's goal of learning how databases work in the context of a basic web application. I feel confident with the back end functionality we've incorporated this week but need to do more work on the 'view' and 'controller' aspects of the MVC model. I am still not 100% comfortable using forms, params and routes to achieve the correct flow through a web application and look forward to improving these skills with more practice.  
___

## State of Completion

### Implemented Functionality

#### Front-end
* Show, add, update, delete, comment on bookmarks
* Flash error if bookmark url is invalid

#### Back-end
* Databases to hold bookmarks, comments, tags and join tables where many-to-many relationships exist
* Classes to wrap data extracted from each database
* Module for database connection in test and development environment

### Further Improvements

* Ensure all routes are RESTful
* Fix foreign keys within interrelated databases
* Add consistent styling to all webpages using CSS
* Ensure a tag cannot be created if it already exists
* Implement tag functionality in the front end
* Full test isolation between classes
* Refactoring tests (eg. using web_helper for feature tests)
___

## Technical

### Tech/Frameworks Used

Ruby, Sinatra, HTML, CSS, RSpec, Rubocop, Capybara, Rackup, PostgreSQL

### Launching the Application

```
$ git clone git@github.com:elishkaflint/rps-challenge.git
$ bundle
$ rackup config.ru
```
____

## Sample User Stories

#### User Story 1
As someone browsing the internet,<br>
So I can see all the bookmarks that I enjoyed<br>
I'd like to see a list of my bookmarks on the homepage

#### User Story 2
As someone browsing the internet,<br>
So I can go back to a website I am visiting<br>
I'd like to be able to add a bookmark to the homepage<br>

#### User Story 3
As someone browsing the internet,<br>
So I can keep my list of bookmarks relevant<br>
I'd like to be able to delete a bookmark<br>
