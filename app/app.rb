ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

# require models at this point.

require_relative 'data_mapper_setup'

class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions

  get '/' do
    erb :index
  end

  get '/space' do
    erb :'space/new'
  end

  post '/space' do
    @space = Space.new(description: params[:description], price: params[:price], location: params[:location], user_id: 1)
    erb :'space/index'
  end

end
