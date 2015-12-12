class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :friendship
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps null: false
    end
  end
end
