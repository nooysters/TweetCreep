# Tweet Creep  
![alt text](https://github.com/nooysters/TweetCreep/blob/master/app/assets/images/logo.png) 

### Twitter tweet viewer.

### How it works.


Tweet Creep uses the rails twitter gem to fetch the last 25 tweets for a given user handle. The module in **lib/twitter_client.rb** initializes a twitter client and provides a wrapper for the needed api function **Twitter::REST::Client.user_timeline** and handles caching with rails cache. The client module approach allows the twitter api functionality to easily be extended and mixed-in anywhere should decide to add features.


Since the app only does one thing, I chose to keep everything on one page keeping the controller and routes very simple. The app roots to **pages#index** and will authenticate (through devise) and then provide the twitter handle form that submits to the update action via ajax and updates the DOM. Javascript regular expressions is used to parse the links, hashtags and @mentions in the tweet text.


Devise signup is disabled to prevent new accounts. The login is in the submission email.

You can view and example [here](http://desolate-oasis-3548.herokuapp.com/)

---

### Local Setup
* Clone the repository.
* If not using postgres, replace the postgres line in the gem file and update database.yml to reflect your local database config.
* run bundle and rake db:migrate.
* Set twitter credentials either in lib/twitter_client.rb or using .env file for heroku local, or any preferred method of setting environment variables.

---

### Basic Heroku deployment
* Set up locally and run heroku create.
* Git push heroku master
* Set heroku environment variables for your twitter api credentials:

```
heroku config:set CONSUMER_KEY=[Your consumer key] CONSUMER_SECRET=[Your secret key] ACCESS_TOKEN=[Your access token] ACCESS_TOKEN_SECRET=[your token secret]
```
Thats it!

---

### Test

```
bundle exec rspec
```