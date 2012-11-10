class Followers < ActiveRecord::Base
  self.table_name = 'users_followers'
  
  belongs_to :user
  belongs_to :followed, :class_name => 'User'
end
