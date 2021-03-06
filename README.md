# Tweet Creep  
![alt text](https://github.com/nooysters/TweetCreep/blob/master/app/assets/images/logo.png) 


### How it works.


- Tweet Creep uses the twitter gem to interact with the Twitter API. It will pull the first 25 tweets for a given twitter handle. 
- The module in **model/concerns/twitter_client.rb** initializes a twitter client and is managed by the twitter_service model.
- Since the app only does one thing, I chose to keep everything on one page keeping the controller and routes very simple. 
- The app roots to **pages#index** and will authenticate (through devise) and then provide the twitter handle form.
- The form submits to the pages#update action via ajax and updates the DOM. 
- There are formatting helpers that parse the @mentions, hashtags and links in the tweet text. There is also a date formatter

- Devise signup is disabled to prevent new accounts. The login is in the submission email.

- You can view and example of the running app [here](http://desolate-oasis-3548.herokuapp.com/)

---

### Local Setup
* Clone the repository.
* If not using postgres, replace the postgres line in the gem file and update database.yml to reflect your local database config.
* run bundle and rake db:migrate.
* Set twitter credentials either in modules/concerns/twitter_client.rb or using .env file for heroku local, or any preferred method of setting environment variables.

---

### Basic Heroku deployment
* Set up locally and run heroku create.
* Git push heroku master
* Set heroku environment variables for your twitter api credentials:

```
heroku config:set CONSUMER_KEY=[Your consumer key] CONSUMER_SECRET=[Your secret key] ACCESS_TOKEN=[Your access token] ACCESS_TOKEN_SECRET=[Your token secret]
```
* Add Memcachier addon to your heroku app

```
heroku addons:create memcachier:dev
```

* Thats it!

---

### Test

```
bundle exec rspec
```