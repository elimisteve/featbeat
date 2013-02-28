# Featbeat

Featbeat is a very simple Quantified self experiment. It was created by [Adam Loving](http://www.adamloving.com), and you can see my instance of it running here:

[http://featbeat.adamloving.com](http://featbeat.adamloving.com)

## What does it do?

Provides a very basic API for logging life events. Entries consist of

verb
count
unit
noun

The actor is considered to be the current user. Examples: 
I ate 1 slice of pie
I did 10 reps of pushups
I ran 1 mile of road

Todos are stored in this [Trello board](https://trello.com/board/featbeat/5105f8abb18f945b56004033)

## Getting started

This is a ruby on rails project.

To run it, currently you need these environment variables set.

DEFAULT_FROM_EMAIL=x@x.com
USER_EMAIL=y@y.com
CUSTOM_URL=http://localhost:3001

(use heroku config:add to add these to your heroku app)

## Add-ons

heroku addons:add cloudmailin:developer
heroku addons:add sendgrid:starter
heroku addons:add scheduler:standard

## Auto-tracking your life

There's a git hook to track when you commit code (update with your own URL)

    curl -d "subject=1 commit featbeat-code committed" http://featbeat.adamloving.com/api/inbound_email

I have IFFFT accepting SMS and forwarding them to cloudmalin via email which hits my API

    heroku config 

and look for your 
     
     CLOUDMAILIN_FORWARD_ADDRESS

Also, IFFFT recipe for Foursquare.

todo: share translations

seems like these should be replaced with webhooks
    

