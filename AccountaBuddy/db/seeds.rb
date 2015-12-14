# CREATES: users, categories, user_categories, friendships

User.delete_all
Category.delete_all
UserCategory.delete_all
Friendship.delete_all

users = User.create!([
	{name: "Eunice", username: "eunice", longitude: -122, latitude: 37.77, email: 'eunice@gmail.com', password: '1234'},
	{name: "Chris", username: "koske", longitude: -122, latitude: 37.68, email: 'koske@gmail.com', password: '1234'},
	{name: "Jenna", username: "jenna", longitude: -122, latitude: 37.54, email: 'jenna@gmail.com', password: '1234'},
	{name: "Tanya", username: "tanya", longitude: -122, latitude: 37.32, email: 'tanya@gmail.com', password: '1234'},
	{name: "Mary", username: "mary", longitude: -122, latitude: 37.75, email: 'mary@gmail.com', password: '1234'},
	{name: "Jupiter", username: "jupiter", longitude: -122, latitude: 37.79, email: 'jupiter@gmail.com', password: '1234'},
	{name: "Chris", username: "chris", longitude: -122, latitude: 37.42, email: 'chris@gmail.com', password: '1234'},
	{name: "Nathan", username: "nathan", longitude: -122, latitude: 37.48, email: 'nathan@gmail.com', password: '1234'},
	{name: "Shawn", username: "shawn", longitude: -122, latitude: 37.59, email: 'shawn@gmail.com', password: '1234'},
	{name: "Mike", username: "mike", longitude: -122, latitude: 37.80, email: 'mike@gmail.com', password: '1234'},
	{name: "Paul", username: "paul", longitude: -122, latitude: 37.35, email: 'paul@gmail.com', password: '1234'},
	{name: "Rosslyn", username: "rosslyn", longitude: -122, latitude: 37.72, email: 'rosslyn@gmail.com', password: '1234'}])

categories = Category.create!([
	{name: "Fitness"},
	{name: "Diet"}])


badges = Badge.create!([
	{name: "Fitness", description: "You're a fitness superstar!"},
	{name: "Diet", description: "You're a Diet superstar!"},
	{name: "Hobbies", description: "You're a Hobbies superstar! "},
	{name: "Education", description: "You're a Education superstar!"},

	])


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
