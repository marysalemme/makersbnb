
require 'data_mapper'

class Booking

  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date, required: true
  property :end_date, Date, required: true

  belongs_to :space

end
