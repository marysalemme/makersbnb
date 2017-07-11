class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'very SuPER DUPeR secret ha ha no hack please'
  use Rack::MethodOverride

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
