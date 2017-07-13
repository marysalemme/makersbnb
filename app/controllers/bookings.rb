class MakersBnb < Sinatra::Base
  get '/bookings/new/:id' do
    session[:space_id] = params[:id]
    @space = Space.get(session[:space_id])
    erb :'/bookings/new'
  end

  get '/bookings/show/:id' do
    @booking = Booking.get(params[:id])
    erb :'/bookings/show'
  end

  post '/bookings' do
    if current_user == nil
      flash.next[:errors] = ["You need to be signed in to book a space"]
      redirect "/bookings/new/#{session[:space_id]}"
    end
    space = Space.get(session[:space_id])
    p params[:start_date]
    p params[:end_date]
    if params[:start_date].empty? || params[:end_date].empty?
      flash.next[:errors] = ["Start and end dates needed"]
      redirect "/bookings/new/#{session[:space_id]}"
    end
    booking = space.bookings.new(start_date: Date.parse(params[:start_date]),
                                 end_date: Date.parse(params[:end_date]))
    if booking.save
      redirect "bookings/show/#{booking.id}"
    else
      flash.now[:errors] = booking.errors.full_messages
      erb :'/bookings/new'
    end
  end
end
