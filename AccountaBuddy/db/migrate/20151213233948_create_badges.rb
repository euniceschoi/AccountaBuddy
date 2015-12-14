class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :points, default: 0
      t.text :description
      t.references :user
      t.string :badge_image_link

      t.timestamps null: false
    end
  end
end
