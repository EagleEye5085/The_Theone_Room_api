![](https://img.shields.io/badge/Rails-5.2.8-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.7.4-orange) ![](https://travis-ci.com/Relocate08/Relocate-Back-End-Rails.svg?branch=main)

## About This Project:

[Relocate08](https://github.com/Relocate08) provides users with the ability to enter an address in order to receive curated information for services near their new home.

Relocate08 is an application that utilizes a frontend, backend, and microservice to consume and expose API data sourced from Yelp. This backend is responsible for receiving requests from the frontend, submiting requests to the microservice which then returns API data for the backend to package and return to the frontend for viewing.

## Table of Contents
* [Local Setup](https://github.com/Relocate08/Relocate-Back-End-Rails/blob/main/README.md#local-setup)
* [Deployment](https://github.com/Relocate08/Relocate-Back-End-Rails/blob/main/README.md#deployment-)
* [Endpoints](https://github.com/Relocate08/Relocate-Back-End-Rails/blob/main/README.md#endpoints)
* [Schema](https://github.com/Relocate08/Relocate-Back-End-Rails/blob/main/README.md#schema-)
* [Authors](https://github.com/Relocate08/Relocate-Back-End-Rails/blob/main/README.md#authors)
## Local Setup:

This project requires:
- Ruby 2.5.3.
- Rails 5.2.4.3

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:create`
    * `rails db:migrate`
* Install Figaro with `bundle exec figaro install` to create an application.yml file locally (this to be updated with any needed ENV variables!!!)

#### Relocate-Back-End utilizes the following gems and libraries in testing:

- [RSpec](https://github.com/rspec/rspec-rails)
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
- [Capybara](https://github.com/teamcapybara/capybara)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)

## Deployment <a name="deployment"></a>

Relocate-Back-End-Rails is deployed remotely via Heroku (https://relocate-back-end-rails.herokuapp.com/)

## Endpoints:

- `get '/:location/utilities/:type'`
- `get '/:location/recreation/:type'`
- `get '/:location/homeservices/:type'`
- `get '/businesses/:id'`

- `get /favorites/:user_id`
- `post /favorites/:user_id/:yelp_business_id (also requires "business_name" params)`
- `delete /favorites/:user_id/:yelp_business_id`

- `get /location/:user_id`
- `post /:location/:user_id`
- `patch /:location/:user_id`
- `delete /location/:user_id`

## Schema <a name="schema"></a>

<img width="667" alt="Relocate BE Schema" src="https://user-images.githubusercontent.com/63476564/104670572-19ab0700-56aa-11eb-81e0-66753a68ac4d.png">


## Authors
  - **Christopher Allbritton** - *Turing Student* - [GitHub Profile](https://github.com/Callbritton) - [Turing Alum Profile](https://alumni.turing.io/alumni/christopher-allbritton) - [LinkedIn](https://www.linkedin.com/in/christopher-allbritton)
  - **Dani Coleman** - *Turing Student* - [GitHub Profile](https://github.com/dcoleman21) - [Turing Alum Profile](https://alumni.turing.io/alumni/dani-coleman) - [LinkedIn](https://www.linkedin.com/in/dcoleman-21/)
  - **Kevin Cuadros** - *Turing Student* - [GitHub Profile](https://github.com/kevxo) - [Turing Alum Profile](https://alumni.turing.io/alumni/kevin-david-cuadros) - [LinkedIn](https://www.linkedin.com/in/kevin-cuadros-2bb4551a1/)
  - **Hanna Davis** - *Turing Student* - [GitHub Profile](https://github.com/Oxalisviolacea) - [Turing Alum Profile](https://alumni.turing.io/alumni/hanna-davis) - [LinkedIn](https://www.linkedin.com/in/hanna-davis/)
  - **Hope Gochnour** - *Turing Student* - [GitHub Profile](https://github.com/hopesgit) - [Turing Alum Profile](https://alumni.turing.io/alumni/hope-mcgee) - [LinkedIn](https://www.linkedin.com/in/hope-gochnour-3056aa1ba/)
  - **Jake Heft** - *Turing Student* - [GitHub Profile](https://github.com/jakeheft) - [Turing Alum Profile](https://alumni.turing.io/alumni/jake-heft) - [LinkedIn](https://www.linkedin.com/in/jakeheft/)
  - **John Kim** - *Turing Student* - [GitHub Profile](https://github.com/abcdefghijohn) - [Turing Alum Profile](https://alumni.turing.io/alumni/john-kim) - [LinkedIn](https://www.linkedin.com/in/abcdefghijohn/)
  - **Jose Lopez** - *Turing Student* - [GitHub Profile](https://github.com/JoseLopez235) - [Turing Alum Profile](https://alumni.turing.io/alumni/jose-lopez) - [LinkedIn](https://www.linkedin.com/in/jose-lopez-0551a01a1/)
  - **Brett Sherman** - *Turing Student* - [GitHub Profile](https://github.com/BJSherman80) - [Turing Alum Profile](https://alumni.turing.io/alumni/brett-sherman) - [LinkedIn](https://www.linkedin.com/in/brettshermanll/)
  - **Zach Stearns** - *Turing Student* - [GitHub Profile](https://github.com/Stearnzy) - [Turing Alum Profile](https://alumni.turing.io/alumni/zach-stearns) - [LinkedIn](https://www.linkedin.com/in/zach-stearns/)
