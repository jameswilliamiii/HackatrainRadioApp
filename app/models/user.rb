class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :username, :password, :password_confirmation
  has_secure_password
  
  has_many :uploads
  
end
