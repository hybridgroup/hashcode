# Runs the `import_tweets` and `generate_stats` jobs on timers, this exists to
# be used with the Clockwork gem so that Heroku can run it in a seperate dyno.

require 'bundler'
Bundler.setup

require 'clockwork'

include Clockwork

import_tweets = File.join(__dir__, "bin/import_tweets")
generate_stats = File.join(__dir__, "bin/generate_stats")

every(2.minutes, "Running import_tweets script") { system import_tweets }
every(2.minutes, "Running generate_stats script") { system generate_stats }
