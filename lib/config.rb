# Sets up config for the app itself and CLI scripts.
# Assumes that all dependencies have already been loaded.

# Load config from `.env`
Dotenv.load

# Checks ENV config to make sure all's good
def check_config
  env_vars = %w(DATABASE_URL HASHCODE_CONSUMER_KEY HASHCODE_CONSUMER_SECRET
                HASHCODE_ACCESS_TOKEN HASHCODE_ACCESS_TOKEN_SECRET)

  missing = env_vars.each_with_object([]) do |var, missing|
    missing << var unless ENV[var].is_a?(String) && ENV[var] != ''
  end

  if missing.any?
    puts "The following environment variables are missing:"
    missing.each { |var| puts "-  #{var}" }
    puts "These must all be set for Hashcode to start."
    abort "Please refer to the README for more details."
  end
end


# Loads all models
def load_models
  Dir["#{__dir__}/../app/models/*.rb"].each do |model|
    require model
  end
end

# Sets up the database connection with DataMapper
def setup_database
  DataMapper.setup :default, ENV["DATABASE_URL"]
  DataMapper.auto_upgrade!
end

# Our Main function, which will set up the config
def main
  check_config
  load_models
  setup_database
end

main
