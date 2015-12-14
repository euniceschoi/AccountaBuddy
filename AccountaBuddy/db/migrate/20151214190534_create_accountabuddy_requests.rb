class CreateAccountabuddyRequests < ActiveRecord::Migration
  def change
    create_table :accountabuddy_requests do |t|
      t.references :user
      t.integer :recipient_id
      t.references :friendship
      t.timestamps null: false

    end
  end
end
