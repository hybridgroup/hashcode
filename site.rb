get "/" do
  @stats = Stats.get_stats
  haml :index
end

get "/stats.json" do
  content_type :json
  Stats.get_stats.to_json
end
