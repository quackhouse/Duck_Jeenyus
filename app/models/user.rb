class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :access_token, :name, :location, :email, :password, :password_confirmation
  validates_uniqueness_of :email, :message => "Sorry, that email's been taken."
  has_many :comments
end