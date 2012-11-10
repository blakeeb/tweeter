class User < ActiveRecord::Base
  has_many :tweets, :order => 'created_at DESC'
  
  # People following me
  # has_many :followings
  # has_many :friends, :through => :followings, :source => 'followed'
  
  # People I'm Following
  has_many :followeds, :class_name => 'Followers', :foreign_key => 'followed_user_id'
  has_many :followers, :through => :followeds, :source => :user
  
#  belongs_to :followers, 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname
  # attr_accessible :title, :body
  
  validates_presence_of :nickname
end
