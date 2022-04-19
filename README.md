# About Hackaton - Health Care App
This project is the result of the second Hackaton of Rails Bootcamp prometed by OneBiteCode. The project proposal is a medical consultation history system.

# Project Health Care App
- The project was built following the business rules from the Hackathon challenge.

![health-care-app](https://i.ibb.co/fXHmZtH/health-care-app.gif)

## Technology Stack

- ruby on rails ``7.0.2``
- ruby ``3.0.3``
- postgresql
- React

# Mockup
The initial design concept was built on figma.

<a href="https://github.com/marcosvto1/heath_history_api/blob/main/public/mockup/health.pdf" target="_blank">Access Link</a>


# Database diagram
The initial database diagram concept was built on dbdesigner.net
<a href="https://github.com/marcosvto1/heath_history_api/blob/main/public/diagram-database/diagram-database.png" target="_blank">Access Link</a>

## Set up

1. Clone the project
```
git clone https://github.com/marcosvto1/heath_history_api.git
```
```
cd heath_history_api
```
2. Install dependencies
``` 
bundle install
``` 
``` 
rails db:create db:migrate
``` 
``` 
yarn install || npm install
``` 

3. Configure .env file with your database information. 
<p> Create the .env file and configure:

![Config-file-env](https://github.com/marcosvto1/heath_history_api/blob/main/public/dotenv/dotenv.png)

4. Start the project
```
rails s
```
