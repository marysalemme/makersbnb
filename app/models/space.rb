
class Space

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :description, Text
  property :price, Float
  property :location, String

end
