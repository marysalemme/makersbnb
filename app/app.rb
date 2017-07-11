ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'models/space'

require_relative 'data_mapper_setup'

class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'very SuPER DUPeR secret ha ha no hack please'

  get '/' do
    erb :index
  end

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

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    new_user
    if @user.save
      session[:user_id] = @user.id
      redirect ('/')
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
      redirect ('/')
    else
      flash.now[:errors] = ['Username or password is incorrect']
      erb :'sessions/new'
    end
  end

  helpers do
    def new_user
      @user = User.new(username: params[:username], email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    end

    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
