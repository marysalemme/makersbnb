class MakersBnb < Sinatra::Base
  get '/bookings/new/:id' do
    session[:space_id] = params[:space_id]
    @space = Space.get(params[:space_id])
    erb :'/bookings/new'
  end

  get '/bookings/:id' do
    @booking = Booking.last
    erb :'/bookings/show'
  end

  post '/bookings' do
    space = Space.last
    booking = space.bookings.new(start_date: Date.parse(params[:start_date]),
    end_date: Date.parse(params[:end_date]))
    if booking.save
      redirect 'bookings/:id'
    else
      flash.now[:errors] = booking.errors.full_messages
      erb :'/bookings/new'
    end
  end
end
