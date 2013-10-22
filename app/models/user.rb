class User < ActiveRecord::Base
  attr_accessible :access_token, :name, :location
  has_many :comments
end