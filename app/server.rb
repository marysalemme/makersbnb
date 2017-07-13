class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'very SuPER DUPeR secret ha ha no hack please'
  use Rack::MethodOverride

  helpers do
    def new_user
      User.new(username: params[:username], email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    end

    def new_space
      Space.new(description: params[:description],
      price: params[:price],
      location: params[:location],
      user_id: session[:user_id])
    end

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end
end
