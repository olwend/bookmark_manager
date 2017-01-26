# bcrypt will generate the password hash
require 'bcrypt' # make sure 'bcrypt' is in your Gemfile

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)  
    end
end
