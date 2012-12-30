get "/" do
  @stats = Stats.get_totals
  haml :'index.html'
end

get "/stats" do
  @stats = Stats.get_totals
  haml :'stats.html', :layout => false
end
