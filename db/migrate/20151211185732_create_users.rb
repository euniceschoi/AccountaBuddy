class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.float :longitude
      t.float :latitude
      t.string :address
      t.text :about_me
      t.string :gender
      t.timestamps null: false
    end
  end
end
