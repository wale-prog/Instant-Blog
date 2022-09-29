# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Mexico.', email: 'ola@gmail.com', password: 'password')
second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1642978276901-29ef66b39ebc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Poland.', email: 'olap@gmail.com', password: 'password')
first_post = Post.create(title: 'Hello', text: 'This is my first post', author_id: first_user)
second_post = Post.create(title: 'Howdy', text: 'This is my second post', author_id: first_user)
third_post = Post.create(title: 'Hi', text: 'This is my third post', author_id: first_user)
fourth_post = Post.create(title: 'Regards', text: 'This is my fourth post', author_id: second_user)

