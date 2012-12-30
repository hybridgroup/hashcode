get "/" do
  @stats = Stats.get_totals
  haml :'index.html'
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end

get "/stats" do
  @stats = Stats.get_totals
  haml :'stats.html', :layout => false
end
