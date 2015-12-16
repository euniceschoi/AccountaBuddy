# CREATES: users, categories, user_categories, friendships

User.delete_all
Category.delete_all
UserCategory.delete_all
Friendship.delete_all


badges = Badge.create!([
	{name: "Fitness", description: "You're a fitness superstar!"},
	{name: "Diet", description: "You're a Diet superstar!"},
	{name: "Hobbies", description: "You're a Hobbies superstar! "},
	{name: "Education", description: "You're a Education superstar!"},

	])

users = User.create!([
	{name: "Eunice", username: "eunice", longitude: -122.35, latitude: 37.77, email: 'eunice@gmail.com', password: '123456', about_me: "I'm happy!", gender: "female"},
	{name: "Chris", username: "koske", longitude: -122.3, latitude: 37.65, email: 'koske@gmail.com', password: '123456', about_me: "I'm optimistic!", gender: "male"},
	{name: "Jenna", username: "jenna", longitude: -122.29, latitude: 37.71, email: 'jenna@gmail.com', password: '123456', about_me: "I'm creative!", gender: "female"},
	{name: "Tanya", username: "tanya", longitude: -122.37, latitude: 37.80, email: 'tanya@gmail.com', password: '123456', about_me: "I'm joyful!", gender: "female"},
	{name: "Mary", username: "mary", longitude: -122.40, latitude: 37.75, email: 'mary@gmail.com', password: '123456', about_me: "I'm energetic!", gender: "female"},
	{name: "Jupiter", username: "jupiter", longitude: -122.38, latitude: 37.69, email: 'jupiter@gmail.com', password: '123456', about_me: "I'm communicative!", gender: "male"},
	{name: "Chris", username: "chris", longitude: -122.25, latitude: 37.42, email: 'chris@gmail.com', password: '123456', about_me: "I'm kind!", gender: "male"},
	{name: "Nathan", username: "nathan", longitude: -122.49, latitude: 37.82, email: 'nathan@gmail.com', password: '123456', about_me: "I'm thoughtful!", gender: "male"},
	{name: "Shawn", username: "shawn", longitude: -122.5, latitude: 37.76, email: 'shawn@gmail.com', password: '123456', about_me: "I'm sensitive!", gender: "male"},
	{name: "Mike", username: "mike", longitude: -122.15, latitude: 37.80, email: 'mike@gmail.com', password: '123456', about_me: "I'm direct!", gender: "male"},
	{name: "Paul", username: "paul", longitude: -122.38, latitude: 37.58, email: 'paul@gmail.com', password: '123456', about_me: "I'm mischievous!", gender: "male"},
	{name: "Rosslyn", username: "rosslyn", longitude: -122.22, latitude: 37.72, email: 'rosslyn@gmail.com', password: '123456', about_me: "I'm a cuddler!", gender: "female"}])

categories = Category.create!([
	{name: "Fitness"},
	{name: "Diet"}])


user_categories = UserCategory.create!([
	{user_id: 1, category_id: 1},
	{user_id: 2, category_id: 1},
	{user_id: 3, category_id: 1},
	{user_id: 4, category_id: 1},
	{user_id: 4, category_id: 2},
	{user_id: 5, category_id: 1},
	{user_id: 6, category_id: 1},
	{user_id: 6, category_id: 2},
	{user_id: 7, category_id: 1},
	{user_id: 8, category_id: 1},
	{user_id: 8, category_id: 2},
	{user_id: 9, category_id: 1},
	{user_id: 9, category_id: 2},
	{user_id: 10, category_id: 1},
	{user_id: 10, category_id: 2},
	{user_id: 11, category_id: 1},
	{user_id: 12, category_id: 1},
	{user_id: 12, category_id: 2} ])

friendships = Friendship.create!([
	{user_id: 1, friend_id: 2, category_id: 1, accountabuddy: true},
	{user_id: 1, friend_id: 3, category_id: 1, accountabuddy: false },
	{user_id: 1, friend_id: 5, category_id: 1, accountabuddy: false },
	{user_id: 1, friend_id: 6, category_id: 1, accountabuddy: false },
	{user_id: 1, friend_id: 7, category_id: 1, accountabuddy: false },
	{user_id: 1, friend_id: 9, category_id: 1, accountabuddy: false },
	{user_id: 1, friend_id: 11, category_id: 1, accountabuddy: false },
	{user_id: 2, friend_id: 1, category_id: 1, accountabuddy: true },
	{user_id: 2, friend_id: 4, category_id: 1, accountabuddy: false },
	{user_id: 2, friend_id: 6, category_id: 1, accountabuddy: false },
	{user_id: 2, friend_id: 7, category_id: 1, accountabuddy: false },
	{user_id: 2, friend_id: 8, category_id: 1, accountabuddy: false },
	{user_id: 2, friend_id: 10, category_id: 1, accountabuddy: false },
	{user_id: 2, friend_id: 12, category_id: 1, accountabuddy: false },
	{user_id: 3, friend_id: 1, category_id: 1, accountabuddy: false },
	{user_id: 3, friend_id: 5, category_id: 1, accountabuddy: true },
	{user_id: 3, friend_id: 7, category_id: 1, accountabuddy: false },
	{user_id: 3, friend_id: 8, category_id: 1, accountabuddy: false },
	{user_id: 3, friend_id: 9, category_id: 1, accountabuddy: false },
	{user_id: 3, friend_id: 11, category_id: 1, accountabuddy: false },
	{user_id: 4, friend_id: 2, category_id: 1, accountabuddy: false },
	{user_id: 4, friend_id: 6, category_id: 2, accountabuddy: true},
	{user_id: 4, friend_id: 8, category_id: 2, accountabuddy: false },
	{user_id: 4, friend_id: 9, category_id: 2, accountabuddy: false },
	{user_id: 4, friend_id: 10, category_id: 2, accountabuddy: false },
	{user_id: 4, friend_id: 12, category_id: 2, accountabuddy: false },
	{user_id: 5, friend_id: 1, category_id: 1, accountabuddy: false },
	{user_id: 5, friend_id: 3, category_id: 1, accountabuddy: true },
	{user_id: 6, friend_id: 1, category_id: 1, accountabuddy: false },
	{user_id: 6, friend_id: 2, category_id: 1, accountabuddy: false },
	{user_id: 6, friend_id: 4, category_id: 2, accountabuddy: true },
	{user_id: 7, friend_id: 1, category_id: 1, accountabuddy: false },
	{user_id: 7, friend_id: 2, category_id: 1, accountabuddy: false },
	{user_id: 7, friend_id: 3, category_id: 1, accountabuddy: false  },
	{user_id: 8, friend_id: 3, category_id: 1, accountabuddy: false  },
	{user_id: 8, friend_id: 2, category_id: 1, accountabuddy: false  },
	{user_id: 8, friend_id: 4, category_id: 2, accountabuddy: false  },
	{user_id: 9, friend_id: 1, category_id: 1, accountabuddy: false  },
	{user_id: 9, friend_id: 3, category_id: 1, accountabuddy: false  },
	{user_id: 9, friend_id: 4, category_id: 2, accountabuddy: false  },
	{user_id: 10, friend_id: 2, category_id: 1, accountabuddy: false  },
	{user_id: 10, friend_id: 4, category_id: 2, accountabuddy: false  },
	{user_id: 11, friend_id: 1, category_id: 1, accountabuddy: false  },
	{user_id: 11, friend_id: 3, category_id: 1, accountabuddy: false  },
	{user_id: 12, friend_id: 2, category_id: 1, accountabuddy: false  },
	{user_id: 12, friend_id: 4, category_id: 2, accountabuddy: false  }])
