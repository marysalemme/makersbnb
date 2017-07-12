
require 'data_mapper'

class Booking

  include DataMapper::Resource

  property :id, Serial
  property :start_date, Text, required: true
  property :end_date, Float, required: true

  belongs_to :space

end
