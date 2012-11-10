class User < ActiveRecord::Base
  has_many :tweets, :order => 'created_at DESC'
  has_and_belongs_to_many :followed, :class_name => 'User', :foreign_key => 'followed_user_id'
#  has_and_belongs_to_many :following, :class_name => 'User', :foreign_key => 'user_id'
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname
  # attr_accessible :title, :body
  
  validates_presence_of :nickname
  
  def followeds_tweets
    Tweet.find_by_sql(<<-SQL
    SELECT *
    FROM 
      tweets t
    WHERE
     t.user_id IN (SELECT followed_user_id FROM users_followers WHERE user_id = #{id})
    SQL
    )
      
    # followers.inject([]) do |arr, user|
    #   arr += user.tweets 
    # end
  end
  
  def news_feed
    followeds_tweets + tweets
  end
  
  def is_following?(compared_user)
    followed.include? compared_user
  end
end
