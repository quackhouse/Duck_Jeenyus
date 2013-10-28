class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :access_token, :name, :location, :email, :password, :password_confirmation
  has_many :comments
end