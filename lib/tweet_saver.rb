class TweetSaver
  attr_accessor :tweets

  def initialize
    if SavedTweet.tweets_present?
      @tweets = get_tweets(SavedTweet.last_tweet_id)
    else
      @tweets = get_tweets
    end
  end

  # Public: Saves Tweets to the database
  #
  # Returns nothing
  def save
    @tweets.each { |tweet| SavedTweet.create_from_tweet(tweet) }
  end

  private

  # Private: Gets up to 100 tweets from the Twitter Search API
  #
  # since_id - optional integer, searches for tweets that come after
  #
  # Returns an array of tweets
  def get_tweets(since_id = nil)
    options = { :result_type => :recent, :count => 100 }
    options[:since_id] = since_id unless since_id.nil?
    Twitter.search("#code2012", options).results
  end
end
