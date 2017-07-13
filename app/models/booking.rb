
require 'data_mapper'

class Booking

  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date, required: true
  property :end_date, Date, required: true
  property :approval, Boolean, :default  => false

  belongs_to :space

end
