class MakersBnb < Sinatra::Base
  get '/space/new' do
    erb :'space/new'
  end

  post '/space' do
    @space = Space.new(description: params[:description], price: params[:price], location: params[:location])
    if @space.save
      redirect 'space/index'
    else
      flash.now[:errors] = @space.errors.full_messages
      erb :'space/new'
    end
  end

  get '/space/index' do
    @space = Space.last
    erb :'space/index'
  end
end
