require 'rspec'

# Generates a test double that has a tweet's attributes.
#
# text - content of tweet
#
# Returns a double
def tweet(text = "")
  double(
    text: text
  )
end
