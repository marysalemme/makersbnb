require 'data_mapper'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :description, Text, required: true
  property :price, Float, required: true
  property :location, String, required: true

  validates_format_of :price, :with => /^(?!(?:0|0\.0|0\.00)$)[+]?\d+(\.\d|\.\d[0-9])?$/

  belongs_to :user
  has n, :bookings

  def occupied?(*dates)
    dates = [Date.today] if dates.empty?
    dates.flatten.each do |date|
      return true if check_occupied(date)
    end
    false
  end

  def available_on
    bookings.last.end_date.strftime("%d/%m/%Y")
  end

  private
  def check_occupied(date)
    bookings.each do |booking|
      return true if (booking.start_date..booking.end_date).include? date
    end
    false
  end
end
