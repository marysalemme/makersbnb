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
    booking_error("You need to be signed in to book a space") unless current_user
    booking_error("Start and end dates needed") if empty_dates?
    booking_error("Dates must be valid") if invalid_dates?

    space = Space.get(session[:space_id])
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
