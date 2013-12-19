# Code 2013

Just a fun little mini-site to track the real-time results of the #code2013
hashtag on Twitter.

## Running

To run the application, you need to define the following environment variables:

- `DATABASE_URL` - Postgres URL to your database (e.g. postgres://localhost/code2013)
- `CODE2012_CONSUMER_KEY` - Twitter app consumer key
- `CODE2012_CONSUMER_SECRET` - Twitter app consumer key
- `CODE2012_OAUTH_TOKEN` - Twitter app OAuth token
- `CODE2012_OAUTH_TOKEN_SECRET` - Twitter app OAuth token secret

Then install dependencies with `bundle install`

After that, you can run the app with `bundle exec rackup -p 3000`
