class MakersBnb < Sinatra::Base
  get '/space/new' do
    erb :'space/new'
  end

  post '/space' do
    @space = Space.new(description: params[:description],
                       price: params[:price],
                       location: params[:location],
                       user_id: session[:user_id])
    if @space.save
      redirect 'space/index'
    else
      flash.now[:errors] = @space.errors.full_messages
      erb :'space/new'
    end
  end

  get '/space/index' do
    @spaces = Space.all
    erb :'space/index'
  end
end
