require 'data_mapper'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :description, Text, required: true
  property :price, Float, required: true
  property :location, String, required: true

  belongs_to :user

end
