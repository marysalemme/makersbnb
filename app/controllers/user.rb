class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = new_user
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end
end
