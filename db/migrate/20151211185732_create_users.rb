class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.float :longitude
      t.float :latitude
      t.string :address
      t.text :about_me
      t.string :gender
      t.timestamps null: false
    end
  end
end
