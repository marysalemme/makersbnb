require 'data_mapper'
require 'dm-timestamps'
require 'dm-postgres-adapter'

require_relative 'models/user'

<<<<<<< HEAD
# need to revert back to env.

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_test#")
=======
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
>>>>>>> parent of 44a6098... Adding properties for users and spaces - also defining their relationship
DataMapper.finalize
DataMapper.auto_upgrade!
