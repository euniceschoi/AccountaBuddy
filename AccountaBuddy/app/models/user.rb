

class User < ActiveRecord::Base
  # attr_accessible :address, :latitude, :longitude

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_friends, :through => :inverse_friendships, source: :user
  has_many :user_categories
  has_many :friend_requests
  has_many :categories, :through => :user_categories

  has_secure_password
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?



  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth['provider']
  #     user.uid = auth['uid']
  #     if auth['info']
  #       user.name = auth['info']['name'] || ""
  #       user.email = auth['info']['email'] || ""
  #     end
  #   end
  # end

  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end
end
