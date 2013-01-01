class CachedTweet
  include DataMapper::Resource

  property :id, Serial
  property :tweet_id, String
  property :tweet, Json
  property :created_at, DateTime

  # Public: Indicates whether cached tweets exist in the database or not
  #
  # Returns a boolean
  def self.tweets_present?
    count > 0 ? true : false
  end

  # Public: Returns the ID of the last tweet persisted to the database
  #
  # Returns an integer
  def self.last_tweet_id
    Integer(first(:order => [ :created_at.desc ]).tweet_id)
  end
end
