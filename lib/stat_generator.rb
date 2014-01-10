class StatGenerator
  # A map of language names to possible shorthand versions.
  LANGS = {
    "Abap" => %w(abap),
    "Ada" => %w(ada),f
    "Apl" => %w(apl),
    "Assembly" => %w(assembly),
    "Alice" => %w(alice),
    "Awk" => %w(awk),
    "Basic" => %w(basic),
    "Bash" => %w(bash),
    "C" => %w(c),
    "C#" => %w(c# csharp c_sharp c-sharp),
    "C++" => %w(c\+\+ cplusplus),
    "cT" => %w(ct),
    "Clean" => %w(clean),
    "Clojure" => %w(clojure clj),
    "Cobol" => %w(cobol),
    "CoffeeScript" => %w(coffeescript),
    "D" => %w(d),
    "Dart" => %w(dart),
    "Delphi" => %w(delphi),
    "Elixir" => %w(elixir),
    "Emacs Lisp" => %w(elisp emacs-lisp emacs),
    "Erlang" => %w(erlang),
    "Factor" => %w(factor),
    "Fantom" => %w(fantom),
    "F#" => %w(f# fsharp f_sharp f-sharp),
    "Forth" => %w(forth),
    "Fortran" => %w(fortran),
    "Frink" => %w(frink),
    "Go" => %w(go golang),
    "Groovy" => %w(groovy),
    "Haskell" => %w(haskell),
    "Haxe" => %w(haxe),
    "J" => %w(j),
    "J#" => %w(j# jsharp j_sharp j-sharp),
    "Java" => %w(java),
    "JavaScript" => %w(javascript js node.js node),
    "Julia" => %w(julia),
    "Ladder Logic" => %w(ladderlogic ladder-logic ladder),
    "Lisp" => %w(lisp),
    "Livescript" => %w(livescript),
    "Logo" => %w(logo),
    "Lua" => %w(lua),
    "ML" => %w(ml),
    "Matlab" => %w(matlab),
    "Mirah" => %w(mirah),
    "Mathematica" => %w(mathematica),
    "Nimrod" => %w(nimrod),
    "Kotlin" => %w(kotlin),
    "Objective-C" => %w(objectivec objective-c objc objective_c),
    "Ocaml" => %w(ocaml),
    "Octave" => %w(octave),
    "PHP" => %w(php),
    "Pascal" => %w(pascal),
    "Perl" => %w(pl perl),
    "Postscript" => %w(postscript),
    "Pogoscript" => %w(pogoscript pogo),
    "Prolog" => %w(prolog),
    "Python" => %w(python),
    "Q" => %w(Q),
    "R" => %w(r rlang),
    "Racket" => %w(racket),
    "RPG" => %w(rpg),
    "Ruby" => %w(ruby rb rubby),
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

  attr_reader :tweets, :stats, :user_langs

  def initialize(tweets)
    @user_langs = {}
    @stats = {}

    @tweets = tweets.collect do |tweet|
      { user: tweet.attrs["user"]["id"], text: tweet.text }
    end

    @tweets.each { |tweet| @user_langs[tweet[:user]] = [] }
    LANGS.each { |name, _| @stats[name] = 0 }
  end

  def generate
    @tweets.each { |tweet| find_langs_in_tweet(tweet) }
    compile_stats
    @stats
  end

  def find_langs_in_tweet(tweet)
    LANGS.each do |name, strings|
      match = false
      strings.each do |string|
        match = true if tweet[:text].match((/(\s|^|,)#{string}(\s|,|$)/i))
      end

      if match
        unless @user_langs[tweet[:user]].include?(name)
          @user_langs[tweet[:user]] << name
        end
      end
    end
  end

  def compile_stats
    @user_langs.each do |user, langs|
      langs.each do |lang|
        @stats[lang] += 1
      end
    end
  end
end
