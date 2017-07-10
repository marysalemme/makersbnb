ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  get '/' do
    erb :index
  end
end
