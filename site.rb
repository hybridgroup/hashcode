get "/" do
  @stats = Stats.get_totals
  haml :index
end

get "/stats" do
  @stats = Stats.get_totals
  haml :stats, :layout => false
end
