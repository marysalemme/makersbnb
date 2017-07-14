class MakersBnb < Sinatra::Base

  post '/search' do
    session[:price_min] = params[:price_min]
    session[:price_max] = params[:price_max]
    session[:location] = params[:location]
    redirect '/search/results'
  end

  get '/search/results' do
    @filtered_spaces = Space.all(:price.gte => session[:price_min],
                                 :price.lte => session[:price_max],
                                 :location => session[:location])
    erb :'/search/results'
  end
end
