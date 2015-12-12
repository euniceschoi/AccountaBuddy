# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Friendship.delete_all
Category.delete_all

# messages = ["Help - I love bacon!", "I'm going to workout!", "You're inspirational!", "Yoga camp in Costa Rica - Let's go!", "Jogging by the Bay!"]


categories = Category.create!([
	{name: "Fitness"},
	{name: "Diet"}])

users = User.create!([
	{username: "eunice", longitude: 136, latitude: 176, email: 'eunice@gmail.com'},
	{username: "chris", longitude: 138, latitude: 174, email: 'chris@gmail.com'},
	{username: "jenna", longitude: 140, latitude: 178, email: 'jenna@gmail.com'},
	{username: "tanya", longitude: 142, latitude: 172, email: 'tanya@gmail.com'}])

users.each do |user|
    user_categories = UserCategory.create!(user_id: user.id, category_id: rand(1..2))
end

# user.each do |user|
# 	user_categories.each do |user_category|
# 		if (user.id != user_category.user_id) &&

# 	end
# end		

# users.each do |userlist|
# 	users.each do |user|
# 		if (user.id != userlist.id) && (user.user_categories.find(category_id: userlist.user_categories.find(:category_id)))
# 			friendships = Friendship.create!(user_id: user.id, friend_id: userlist.id, category_id: user.user_categories.find(category_id))
# 		end
# 	end
# end		

#find_or_create_by
# && (user_categories.user_id.category_id == userlist.user_categories.category_id)
# , category_id: user_category.category_id



