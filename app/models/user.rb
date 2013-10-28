class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :message => "Sorry, that email's been taken."
  attr_accessible :access_token, :name, :location, :email, :password, :password_confirmation
  has_many :comments
end