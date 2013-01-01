class TweetCacher
  attr_accessor :tweets

  def initialize
    if CachedTweet.tweets_present?
      @tweets = get_tweets(CachedTweet.last_tweet_id)
    else
      @tweets = get_tweets
    end
  end

  # Public: Caches Tweets in the database
  #
  # Returns nothing
  def cache
    @tweets.each { |tweet| CachedTweet.create_from_tweet(tweet) }
  end

  private

  # Private: Gets up to 100 tweets from the Twitter Search API
  #
  # since_id - optional integer, searches for tweets that come after
  #
  # Returns an array of tweets
  def get_tweets(since_id = nil)
    options = { :result_type => :recent, :rpp => 100 }
    options[:since_id] = since_id unless since_id.nil?
    Twitter.search("#code2012", options)
  end
end
