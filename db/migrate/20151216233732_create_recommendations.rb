class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
    	t.text :body
    	t.references :user
    	t.integer :recipient_id
      t.timestamps null: false
    end
  end
end
