class User
  include DataMapper::Resource
  
  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password_digest, Text
  
  
end
