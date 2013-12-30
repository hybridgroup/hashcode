class StatGenerator
  # A map of language names to possible shorthand versions.
  LANGS = {
    "Abap" => %w(abap),
    "Ada" => %w(ada),
    "Apl" => %w(apl),
    "Assembly" => %w(assembly),
    "Alice" => %w(alice),
    "Awk" => %w(awk),
    "Basic" => %w(basic),
    "Bash" => %w(bash),
    "C" => %w(c),
    "C#" => %w(c# csharp c_sharp c-sharp),
    "C++" => %w(c++ cplusplus),
    "cT" => %w(ct),
    "Clean" => %w(clean),
    "Clojure" => %w(clojure clj),
    "Cobol" => %w(cobol),
    "CoffeeScript" => %w(coffeescript),
    "D" => %w(d),
    "Dart" => %w(dart),
    "Delphi" => %w(delphi),
    "Elixir" => %w(elixir),
    "Emcas Lisp" => %w(elisp),
    "Erlang" => %w(erlang),
    "F#" => %w(f# fsharp f_sharp f-sharp),
    "Forth" => %w(forth),
    "Fortran" => %w(fortran),
    "Go" => %w(go golang),
    "Groovy" => %w(groovy),
    "Haskell" => %w(haskell),
    "J" => %w(j),
    "J#" => %w(j# jsharp j_sharp j-sharp),
    "Java" => %w(java),
    "JavaScript" => %w(javascript),
    "Julia" => %w(julia),
    "Ladder Logic" => %w(ladderlogic ladder-logic ladder),
    "Lisp" => %w(lisp),
    "Livescript" => %w(livescript),
    "Logo" => %w(logo),
    "Lua" => %w(lua),
    "ML" => %w(ml),
    "Matlab" => %w(matlab),
    "Objective-C" => %w(objectivec objective-c objc objective_c),
    "Ocaml" => %w(ocaml),
    "Octave" => %w(octave),
    "PHP" => %w(php),
    "Pascal" => %w(pascal),
    "Perl" => %w(pl perl),
    "Postscript" => %w(postscript),
    "Prolog" => %w(prolog),
    "Python" => %w(python),
    "Q" => %w(Q),
    "R" => %w(r rlang),
    "RPG" => %w(rpg),
    "Ruby" => %w(ruby rb),
    "Rust" => %w(rust),
    "SAS" => %w(sas),
    "Sass" => %w(sass),
    "SQL" => %w(sql mysql postgresql),
    "Scala" => %w(scala),
    "Scheme" => %w(scheme),
    "Scratch" => %w(scratch),
    "Smalltalk" => %w(smalltalk),
    "TCL" => %w(TCL),
    "VBScript" => %w(vbscript),
    "VimScript" => %w(vimscript vim-script)
  }

  attr_reader :tweets, :stats

  def initialize(tweets)
    @tweets = tweets.collect { |tweet| tweet.text }
    @stats = {}
    LANGS.each { |name, _| @stats[name] = 0 }
  end

  def generate
    @tweets.each { |tweet| find_langs_in_tweet(tweet) }
    @stats
  end

  def find_langs_in_tweet(tweet)
    LANGS.each do |name, strings|
      match = false
      strings.each do |string|
        match = true if tweet.match((/(\s|\b|,)#{string}(\s|,|$)/i))
      end

      @stats[name] += 1 if match
    end
  end
end
