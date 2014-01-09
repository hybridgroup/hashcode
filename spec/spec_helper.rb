require 'rspec'

# Generates a test double that has a tweet's attributes.
#
# text - content of tweet
#
# Returns a double
def tweet(text = "", id = rand(1..1000))
  double(
    attrs: { "user" => { "id" => id } },
    text: text
  )
end
