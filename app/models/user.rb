require "bcrypt"

class User

  include DataMapper::Resource

  include BCrypt

  has n, :space

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true

end
