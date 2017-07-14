class MakersBnb < Sinatra::Base
  get '/space/new' do
    erb :'space/new'
  end

  post '/space' do
    @space = new_space
    if @space.save
      redirect '/space'
    else
      flash.now[:errors] = @space.errors.full_messages
      erb :'space/new'
    end
  end

  get '/space' do
    @spaces = Space.all
    erb :'space/index'
  end

  get '/space/:id' do
    @space = Space.get(params[:id])
    erb :'space/show'
  end
end
