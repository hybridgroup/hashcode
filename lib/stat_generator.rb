require "langs"

class StatGenerator
  attr_reader :tweets, :stats, :user_langs

  def initialize(tweets)
    @user_langs = {}
    @stats = {}

    @tweets = []
    tweets.each do |tweet|
      @tweets << { user: tweet.attrs["user"]["id"], text: tweet.text }
    end

    @tweets.each { |tweet| @user_langs[tweet[:user]] = [] }
    LANGS.each { |name, _| @stats[name] = 0 }
  end

  def generate
    @tweets.each { |tweet|
      find_langs_in_tweet(tweet) unless has_blocked_terms?(tweet) }
    compile_stats
    @stats
  end

  def find_langs_in_tweet(tweet)
    LANGS.each do |name, strings|
      match = false
      strings.each do |string|
        match = true if tweet[:text].match((/(\s|^|,|#)#{string}(\s|,|\.|$)/i))
      end

      if match
        unless @user_langs[tweet[:user]].include?(name)
          @user_langs[tweet[:user]] << name
        end
      end
    end
  end

  def has_blocked_terms?(tweet)
    return false if ENV["HASHCODE_BLOCKED_TERMS"].nil?
    blocked_terms = ENV["HASHCODE_BLOCKED_TERMS"].split(',')
    blocked_terms.each do |bad|
      match = tweet[:text].match((/(\s|^|,|#|@)#{bad}(\s|,|\.|$)/i))
      return true if match
    end
    return false
  end

  def compile_stats
    @user_langs.each do |user, langs|
      langs.each do |lang|
        @stats[lang] += 1
      end
    end
  end
end
