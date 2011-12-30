require 'twitter'

class Stats
  LANGS = ["c", "c#", "c++", "basic", "ruby", "python", "php", "java", "delphi",
          "objective-c", "obj-c", "perl", "javascript", "delphi", "lisp", "sql", "pascal", "ada",
          "logo", "assembly", "abap", "clojure", "scheme", "lua", "bash", "fortran", "erlang",
          "scratch", "prolog", "go", "f#", "cobol", "d", "forth", "r", "haskell", "apl", "tcl", "ml",
          "octive"]

  def self.totals
    @@totals ||= {}  
  end

  def self.get_totals
    Twitter.search("#code2011", :rpp => 10).each do |t|
      self.get_totals_for_tweet(t)
    end
    totals
  end

  # return array of languages
  def self.get_langs_for_tweet(t)
    matches = []
    LANGS.each do |lang|
      matches << lang if t.text.match(/(\s|\b|,)#{lang}(\s|\b|,|$)/i)
    end
    matches
  end

  # return array of languages
  def self.get_totals_for_tweet(t)
    LANGS.each do |lang|
      self.add_to_total(lang) if t.text.match(/(\s|\b|,)#{lang}(\s|\b|,|$)/i)
    end
  end

  def self.add_to_total(lang)
    if totals[lang]
      totals[lang] = totals[lang] + 1
    else
      totals[lang] = 1
    end
  end
end
