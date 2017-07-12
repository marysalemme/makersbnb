class MakersBnb < Sinatra::Base
  get '/bookings/new' do
    erb :'/bookings/new'
  end

  post '/bookings' do
    start = Date.parse(params[:start_date])
    finish = Date.parse(params[:end_date])
    space_id = params[:space_id]
    booking = Booking.new(start_date: start, end_date: finish, space_id: space_id)
    if booking.save
      redirect '/'
    else
      flash.now[:errors] = booking.errors.full_messages
      erb :'/bookings/new'
    end
  end
end
