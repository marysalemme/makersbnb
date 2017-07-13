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

    def redirect_unauthenticated_users(error: "You must sign in first", path: '/')
      flash.next[:errors] = [error]
      redirect "#{path}"
    end

    def check_booking_errors
      booking_error("You need to be signed in to book a space") unless current_user
      booking_error("Start and end dates needed") if empty_dates?
      booking_error("Dates must be valid") if invalid_dates?
    end

    def booking_error(error_message)
      flash.next[:errors] = [error_message]
      redirect "/bookings/new/#{session[:space_id]}"
    end

    def empty_dates?(start_date = params[:start_date], end_date = params[:end_date])
      start_date.empty? || end_date.empty?
    end

    def invalid_dates? (start_date = params[:start_date], end_date = params[:end_date])
      Date.parse(start_date) >= Date.parse(end_date)
    end
  end
end
