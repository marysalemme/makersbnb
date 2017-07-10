
require "bcrypt"

class User

  include DataMapper::Resource

  include BCrypt

  has n, :space

  property :id, Serial
  property :username, String, :unique => true
  property :email, String, :unique => true


end
