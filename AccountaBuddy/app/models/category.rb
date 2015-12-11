class Category < ActiveRecord::Base
  has_many :friendships
  belongs_to :user
end
