class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user
      t.integer :friend_id
      t.references :category
      t.boolean :accountabuddy
      t.string :messages, array: true, default: []

      t.timestamps null: false
    end
  end
end
