class Vote < ActiveRecord::Base
  attr_accessible :user_id, :value, :comment_id, :date_created

  belongs_to :user
  belongs_to :comment
end