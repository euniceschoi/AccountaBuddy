class CreateUserCategories < ActiveRecord::Migration
  def change
    create_table :user_categories do |t|
      t.references :user
      t.references :category
      t.timestamps null: false
    end
  end
end
