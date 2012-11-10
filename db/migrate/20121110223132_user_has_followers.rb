class UserHasFollowers < ActiveRecord::Migration
  def change
    create_table :users_followers do |t|
      t.references :user
      t.references :followed_user, :class_name => 'User'
      t.timestamps
    end
  end
end
