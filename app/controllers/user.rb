class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    new_user
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['Username or password is incorrect']
      erb :'sessions/new'
    end
  end
end
