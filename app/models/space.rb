require 'data_mapper'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :description, Text, required: true
  property :price, Float, required: true
  property :location, String, required: true

  belongs_to :user
  has n, :bookings

  def available?
    self.bookings.each do |booking|
      return false if booking.start_date...booking.end_date === Date.today
    end
    true
  end

  def available_on
    date = self.bookings.last.end_date
    date.strftime("%d/%m/%Y")
  end

end
