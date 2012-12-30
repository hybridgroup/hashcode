require 'twitter'

class Stats
  LANGS = %w(abap ada apl assembly awk bash basic c c# c++ clojure cobol
             coffeescript d delphi erlang f# forth fortran go haskell
             java javascript lisp logo lua matlab ml obj-c objective-c
             octive pascal perl php prolog python r rpg ruby sas scala
             scheme scratch smalltalk sql tcl)

  def self.totals
    @@totals ||= {}
  end

  def self.clear_totals
    @@totals = {}
  end

  def self.get_totals
    clear_totals
    Twitter.search("#code2012", :rpp => 100, :result_type => :recent).each do |t|
      get_totals_for_tweet(t)
    end
    totals.sort_by {|lang, total| total}.reverse
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
      self.add_to_total(lang) if t.text.match(/(\s|\b|,)#{lang}(\s|,|$)/i)
    end
  end

  def self.add_to_total(lang)
    lang = "objective-c" if lang == "obj-c"
    if totals[lang]
      totals[lang] = totals[lang] + 1
    else
      totals[lang] = 1
    end
  end
end
