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

  get '/users/spaces' do
    redirect_unauthenticated_users(error: 'You must be logged in to view your Spaces',
                                   path: '/space') unless current_user
    @users_spaces = current_user.spaces.all
    erb :'/users/spaces'
  end
end
