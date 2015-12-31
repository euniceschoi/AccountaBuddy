

class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_friends, :through => :inverse_friendships, source: :user
  has_many :user_categories
  has_many :friend_requests
  has_many :categories, :through => :user_categories
  has_many :conversations, foreign_key: :sender_id
  has_many :conversations, foreign_key: :recipient_id
  has_many :badges
  has_many :accountabuddy_requests
  has_many :recommendations

  has_secure_password

  geocoded_by :address
  mount_uploader :attachment
  after_validation :reverse_geocode
  validates_length_of :password, :in => 6..20
  validates_presence_of :name, :username, :email, :password
  validates_uniqueness_of :username, :email
  # after_validation :geocode, :if => :address_changed?


  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])

      user.email = "#{auth['uid']}@#{auth['provider']}.com"
      user.password = auth['uid']
      user.name = auth['info']['name']
      user.gender = auth['extra']['raw_info']['gender']


      if User.exists?(user)
        user
      else
        user.save!
          badge1 = Badge.new(name: "Fitness", description: "You're a fitness superstar!", user_id: user.id, badge_image_link: "fitness-badge.png")
          badge2 = Badge.new(name: "Diet", description: "You're a Diet superstar!", user_id: user.id, badge_image_link:"diet-badge.png")
          badge3 = Badge.new(name: "Hobbies", description: "You're a Hobbies superstar!", user_id: user.id, badge_image_link:"hobbies-badge.png")
          badge4 = Badge.new(name: "Education", description: "You're a Education superstar!", user_id: user.id, badge_image_link:"education-badge.png")
          badge1.save && badge2.save && badge3.save && badge4.save
        user
      end

  end
end
