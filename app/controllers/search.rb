class MakersBnb < Sinatra::Base
  
  post '/search' do
    session[:price_min] = params[:price_min]
    session[:price_max] = params[:price_max]
    redirect '/search/results'
  end
  
  get '/search/results' do
    @filtered_spaces = Space.all(:price.gt => session[:price_min], :price.lt => session[:price_max])
    erb :'/search/results'
  end
end
