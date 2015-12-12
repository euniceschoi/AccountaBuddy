class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.references :user
      t.integer :recipient_id
      t.boolean :friends, default: false
      t.timestamps null: false
    end
  end
end
