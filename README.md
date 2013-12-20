# Hashcode

Hashcode is a site to track the real-time results of the #code2013 hashtag on
Twitter.

## ENV variables

To run the Hashcode app, you'll need some environment variables set. These are:

- `DATABASE_URL` - Postgres URL to your database (e.g. postgres://localhost/code2013)
- `HASHCODE_CONSUMER_KEY` - Twitter app consumer key
- `HASHCODE_CONSUMER_SECRET` - Twitter app consumer key
- `HASHCODE_ACCESS_TOKEN` - Twitter app OAuth token
- `HASHCODE_ACCESS_TOKEN_SECRET` - Twitter app OAuth token secret

## Running

1. Install dependencies with Bundler - `bundle install`
2. Run the server - `bundle exec rackup -p 3000`
