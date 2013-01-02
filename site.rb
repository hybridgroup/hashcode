get "/" do
  @stats = Stats.collect
  @count = SavedTweet.count
  haml :index
end

get "/stats.json" do
  content_type :json
  Stats.collect.to_json
end
