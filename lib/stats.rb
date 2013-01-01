class Stats
  attr_accessor :stats

  LANGS = %w(abap ada apl assembly awk bash basic c c# c++ clojure cobol
             coffeescript d delphi erlang f# forth fortran go haskell
             java javascript lisp logo lua matlab ml obj-c objective-c
             octive pascal perl php prolog python r rpg ruby sas scala
             scheme scratch smalltalk sql tcl)

  # Public: Gets language occurence totals from Twitter search for #code2012
  #
  # Returns an array of language occurences
  def self.get_stats
    @stats = []
    get_tweets.each { |tweet| get_langs_from_tweet(tweet) }
    @stats.sort_by { |stat| stat[:value] }.reverse
  end

  # Public: Gets languages in tweet text and adds to toal
  #
  # tweet - Tweet to find language mentions in
  #
  # Returns an array of languages
  def self.get_langs_from_tweet(tweet)
    LANGS.each do |lang|
      self.add_to_total(lang) if tweet.attrs['text'].match(/(\s|\b|,)#{lang}(\s|,|$)/i)
    end
  end

  # Public: Adds the language to the array of language counts
  #
  # Returns the current number of occurences of that language as an integer
  def self.add_to_total(lang)
    lang = "objective-c" if lang == "obj-c"

    if @stats.select { |f| f[:language] == lang }.first
      @stats.select { |f| f[:language] == lang }.first[:value] += 1
    else
      @stats << {:language => lang, :value => 1}
    end
  end

  # Public: Searchs for tweets tagged with #code2012
  #
  # Returns an array of Tweets.
  def self.get_tweets
    CachedTweet.all
  end
end
