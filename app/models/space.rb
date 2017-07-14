require 'data_mapper'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :description, Text, required: true
  property :price, Float, required: true
  property :location, String, required: true

  belongs_to :user
  has n, :bookings

  def occupied?(*dates)
    dates = [Date.today] if dates.empty?
    dates.each { |date| return true if check_occupied(date) }
    false
  end

  def available_on
    bookings.last.end_date.strftime("%d/%m/%Y")
  end

  private
  def check_occupied(date)
    bookings.each { |booking| return true if booking.start_date...booking.end_date === date }
    false
  end
end
