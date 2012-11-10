class Tweet < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  
  validates_presence_of :user_id
end
