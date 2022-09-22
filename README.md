![](https://img.shields.io/badge/Rails-5.2.8-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.7.4-orange) ![](https://travis-ci.com/Relocate08/Relocate-Back-End-Rails.svg?branch=main)

## About This Project:

[The Throne Room](https://github.com/EagleEye5085/The_Throne_Room_api) provides users with the ability to review public restrooms in their area

The Throne Room is an application that utilizes a frontend and backend application together they store bathroom locations and reviews displaying them on a map. This backend is responsible for receiving requests from the frontend and converting addresses and ip-addresses to lattitude and longitude.  

## Table of Contents
* [Local Setup](https://github.com/EagleEye5085/The_Throne_Room_api/blob/main/README.md#local-setup)
* [Deployment](https://github.com/EagleEye5085/The_Throne_Room_api/blob/main/README.md#deployment-)
* [Endpoints](https://github.com/EagleEye5085/The_Throne_Room_api/blob/main/README.md#endpoints)
* [Schema](https://github.com/EagleEye5085/The_Throne_Room_api/blob/main/README.md#schema-)
* [Authors](https://github.com/EagleEye5085/The_Throne_Room_api/blob/main/README.md#authors)
## Local Setup:

This project requires:
- Ruby 2.7.4
- Rails 5.2.8

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:create`
    * `rails db:migrate`

#### Throne-Room-Back-End utilizes the following gems and libraries in testing:

- [RSpec](https://github.com/rspec/rspec-rails)
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
- [Capybara](https://github.com/teamcapybara/capybara)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [vcr](https://github.com/vcr/vcr)
- [webmock](https://github.com/bblimke/webmock)
- [faker](https://github.com/faker-ruby/faker)
- [factory_bot](https://github.com/thoughtbot/factory_bot)

## Deployment <a name="deployment"></a>

Throne-Room-api is deployed remotely via Heroku (https://the-throne-room-api.herokuapp.com/)

## Endpoints:
### Throne Rooms
- `get '/throne_rooms'`
- `get '/throne_rooms/:id'`
- `post '/throne_rooms'`
- `patch '/throne_rooms/:id'`
- `delete '/throne_rooms/:id'`
- `get '/throne_rooms/closest_five'`
- `get '/throne_rooms/last_five'`
### Reviews
- `get '/throne_rooms/:id/reviews'`
- `get '/throne_rooms/:throne_id/reviews/:id'`
- `post '/throne_rooms/:id/reviews'`
- `patch '/throne_rooms/:throne_id/reviews/:id'`
- `delete '/throne_rooms/:throne_id/reviews/:id'`
- `get '/throne_rooms/:id/reviews/recent'`

## Schema <a name="schema"></a>

<img width="667" alt="The Throne Room BE Schema" src="https://user-images.githubusercontent.com/102835975/191836417-304e418f-c370-4763-b6eb-47c722756db8.png">


## Authors
  - **Michael Bonini** - *Turing Student* - [GitHub Profile](https://github.com/mkbonini) - [LinkedIn](https://www.linkedin.com/in/michael-bonini-187157131/)
  - **Thomas Turner** - *Turing Student* - [GitHub Profile](https://github.com/EagleEye5085) - [LinkedIn](https://www.linkedin.com/in/thomasturner482/)
  - **Ethan Nguyen** - *Turing Student* - [GitHub Profile](https://github.com/Ethan-t-n) - [LinkedIn](https://www.linkedin.com/in/ethan-nguyen-82b398233/)
  - **Ben Silverstein** - *Turing Student* - [GitHub Profile](https://github.com/bensjsilverstein/) - [LinkedIn](https://www.linkedin.com/in/benjamin-silverstein-42545a109/)
  - **Gauri Joshi** - *Turing Student* - [GitHub Profile](http://github.com/gaurijo) - [LinkedIn](https://www.linkedin.com/in/gaurijo/)
  - **Mary Turpin** - *Turing Student* - [GitHub Profile](https://github.com/MaryT573) - [LinkedIn](https://www.linkedin.com/in/mary-turpin-434140150/)
