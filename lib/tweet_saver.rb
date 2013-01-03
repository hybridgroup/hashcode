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

  # Builds up an inital pool of tweets, defaults to 1500.
  #
  # Returns nothing
  def self.create_backlog(pages = 15)
    (1..pages).each do |page|
      options = { :result_type => :recent, :rpp => 100, :page => page }
      tweets = Twitter.search("#code2012", options)
      tweets.each { |tweet| SavedTweet.create_from_tweet(tweet) }

      # Avoid calling the API too much by stopping for a second.
      sleep(0.25)
    end
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
