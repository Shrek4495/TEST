# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{name: 'Vasya'}, {name: 'Petya'}])

categories = Category.create([{title: 'Ryby'}, {title: 'Python'}])

tests = Test.create([{title: 'Руби массивы', level: 2, author: users.last, category: categories.first},
                     {title: 'Python методы', level: 3, author: users.last, category: categories.last}])

questions = Question.create([{body: ' Аббривиатура массива', test: tests.first},
                             {body: 'Метод для вывода сообщения на экран', test: tests.last}])

Answer.create([{body: 'Arr', correct: true, question: questions.first},
               {body: 'print', correct: true, question: questions.last}])

TestsUser.create(test: tests.last, users: users.last)