class FriendRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :category
end
