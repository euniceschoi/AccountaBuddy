class User < ActiveRecord::Base
  has_many :friendships
  has_many :categories

end
