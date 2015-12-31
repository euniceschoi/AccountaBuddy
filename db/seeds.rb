
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
	{name: "Chris", username: "koske", longitude: -122.404293, latitude: 37.787505, email: 'koske@gmail.com', password: '123456', about_me: "I'm optimistic!", gender: "male"},
	{name: "Jenna", username: "jenna", longitude: -122.397298, latitude: 37.789625, email: 'jenna@gmail.com', password: '123456', about_me: "I'm creative!", gender: "female"},
	{name: "Tanya", username: "tanya", longitude:  -122.399701, latitude: 37.787776, email: 'tanya@gmail.com', password: '123456', about_me: "I'm joyful!", gender: "female"},
	{name: "Mary", username: "mary", longitude: -122.400666, latitude: 37.784825, email: 'mary@gmail.com', password: '123456', about_me: "I'm energetic!", gender: "female"},
	{name: "Jupiter", username: "jupiter", longitude: -122.405237, latitude: 37.783774, email: 'jupiter@gmail.com', password: '123456', about_me: "I'm communicative!", gender: "male"},
	{name: "Chris", username: "chris", longitude: -122.401096, latitude: 37.782078, email: 'chris@gmail.com', password: '123456', about_me: "I'm kind!", gender: "male"},
	{name: "Nathan", username: "nathan", longitude: -122.396654, latitude: 37.778313, email: 'nathan@gmail.com', password: '123456', about_me: "I'm thoughtful!", gender: "male"},
	{name: "Shawn", username: "shawn", longitude: -122.393907, latitude: 37.776176, email: 'shawn@gmail.com', password: '123456', about_me: "I'm sensitive!", gender: "male"},
	{name: "Mike", username: "mike", longitude: -122.389315, latitude: 37.770511, email: 'mike@gmail.com', password: '123456', about_me: "I'm direct!", gender: "male"},
	{name: "Paul", username: "paul", longitude: -122.410945, latitude: 37.779246, email: 'paul@gmail.com', password: '123456', about_me: "I'm mischievous!", gender: "male"},
	{name: "Rosslyn", username: "rosslyn", longitude: -122.416073, latitude: 37.785351, email: 'rosslyn@gmail.com', password: '123456', about_me: "I'm a cuddler!", gender: "female"}])

categories = Category.create!([
	{name: "Fitness"},
	{name: "Diet"},
	{name: "Education"},
	{name: "Hobbies"}])


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
	{user_id: 11, category_id: 1}])

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
	])