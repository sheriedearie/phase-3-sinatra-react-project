puts "🌱 Seeding..."

spencer = User.create(username: "Spenc.91", email: "spencer@gmail.com")
sheridan = User.create(username: "Sher123", email: "sheridanmaustad@gmail.com")
stacy = User.create(username: "qt321", email: "special23@yahoo.com")
ollie = User.create(username: "123ollie", email: "123ollie123@hotmail.com")

Todo.create(user: spencer, name: "chores", task: "dishes", completed: false)
Todo.create(user: spencer, name: "chores", task: "wash the dog", completed: false)
Todo.create(user: spencer, name: "chores", task: "mop the floors", completed: false)
Todo.create(user: spencer, name: "chores", task: "counters", completed: false)
Todo.create(user: sheridan, name: "chores", task: "clean windows", completed: false)
Todo.create(user: sheridan, name: "chores", task: "clean out cat", completed: false)
Todo.create(user: sheridan, name: "chores", task: "finish project", completed: false)
Todo.create(user: ollie, name: "task", task: "go to the park", completed: false)
Todo.create(user: ollie, name: "chores", task: "make dinner", completed: false)
Todo.create(user: stacy, name: "chores", task: "get off her ass", completed: false)
Todo.create(user: stacy, name: "chores", task: "dust", completed: false)

puts "Done seeding!"
