# Featbeat

Featbeat is a very simple Quantified self experiment. It was created by [Adam Loving](http://www.adamloving.com), and you can see my instance of it running here:

[http://featbeat.adamloving.com](http://featbeat.adamloving.com)

## What does it do?

Provides a very basic API for logging life events. Entries consist of

count
unit
noun
verb

For example: 1 slice pie ate

Todos are stored in this [Trello board](https://trello.com/board/featbeat/5105f8abb18f945b56004033)

## Getting started

This is a ruby on rails project.

To run it, currently you need these environment variables set.

export DEFAULT_FROM_EMAIL=x@x.com
export USER_EMAIL=y@y.com
export CUSTOM_URL=http://localhost:3001

(use heroku config:add to add these to your heroku app)



