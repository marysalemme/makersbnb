ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'models/space'
require_relative '../spec/backend/helpers'

require_relative 'data_mapper_setup'

class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  set :session_secret, 'very SuPER DUPeR secret ha ha no hack please'

  get '/' do
    erb :index
  end

  get '/space' do
    erb :'space/new'
  end

  post '/space' do
    @space = Space.new(description: params[:description], price: params[:price], location: params[:location])
    if @space.save
      erb :'space/index'
    else
      flash.now[:errors] = @space.errors.full_messages
      erb :'space/new'
    end
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username], email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect ('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end
end
