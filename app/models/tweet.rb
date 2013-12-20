class Tweet
  include DataMapper::Resource

  property :id, Serial
  property :tweet_id, String
  property :attrs, Json
  property :created_at, DateTime

  def text
    attrs['text']
  end

  class << self
    # Public: Creates a CachedTweet from a Tweet object
    #
    # tweet - the tweet to cache
    #
    # Returns the new CachedTweet
    def create_from_tweet(tweet)
      create(
        :tweet_id   => tweet.id,
        :attrs      => tweet.attrs,
        :created_at => tweet.created_at
      )
    end

    # Public: Indicates whether cached tweets exist in the database or not
    #
    # Returns a boolean
    def any?
      count > 0 ? true : false
    end

    # Public: Returns the ID of the last tweet persisted to the database
    #
    # Returns an integer
    def last_tweet_id
      Integer(first(:order => [ :created_at.desc ]).tweet_id)
    end
  end
end
