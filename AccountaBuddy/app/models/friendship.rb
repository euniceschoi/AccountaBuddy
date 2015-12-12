class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :category
  has_many :messages
end
