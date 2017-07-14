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

  get "/bookings/requests" do
    @user = current_user
    @spaces = @user.spaces
    erb :'bookings/requests'
  end

  post "/bookings/requests/:id" do
     @booking = Booking.get(params[:id])
     @booking.update(approval: true)
     redirect '/bookings/requests'
  end

  post '/bookings' do
    check_booking_errors
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
