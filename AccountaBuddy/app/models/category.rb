class Category < ActiveRecord::Base
  has_many :friendships
  has_many :user_categories
  has_many :users, :through => :user_categories
  has_many :friend_requests
end
