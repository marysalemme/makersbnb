<<<<<<< HEAD
require "bcrypt"

=======
>>>>>>> parent of 44a6098... Adding properties for users and spaces - also defining their relationship
class User
  include DataMapper::Resource

  property :id, Serial
<<<<<<< HEAD
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true

=======
>>>>>>> parent of 44a6098... Adding properties for users and spaces - also defining their relationship
end
