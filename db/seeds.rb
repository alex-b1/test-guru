# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

categories = [
    {title: 'География'},
    {title: 'Биология'},
    {title: 'Химия'},
]

tests = [
    {title: 'Города', level: 1, category_id: 1},
    {title: 'Животные', level: 2, category_id: 2},
    {title: 'Вещества', level: 1, category_id: 3},
    {title: 'Страны', level: 2, category_id: 1},
    {title: 'Реки', level: 3, category_id: 1},
]

questions = [
    {body: 'Столица Италии?', test_id: 1},
    {body: 'Сколько ног у паука?', test_id: 2},
    {body: '7 элемент таблицы Менделеева', test_id: 3},
    {body: 'Самая маленькая страна?', test_id: 4},
    {body: 'Самая длинная река?', test_id: 5},
]

answers = [
    {title: 'Рим', correct: true, question_id: 1},
    {title: 'Венеция', correct: false, question_id: 1},
    {title: 'Неаполь', correct: false, question_id: 1},
    {title: 'Милан', correct: false, question_id: 1},
    {title: '8', correct: true, question_id: 2},
    {title: '7', correct: false, question_id: 2},
    {title: '6', correct: false, question_id: 2},
    {title: '5', correct: false, question_id: 2},
    {title: 'Азот', correct: true, question_id: 3},
    {title: 'Кислород', correct: false, question_id: 3},
    {title: 'Фтор', correct: false, question_id: 3},
    {title: 'Натрий', correct: false, question_id: 3},
    {title: 'Ватикан', correct: true, question_id: 4},
    {title: 'Монако', correct: false, question_id: 4},
    {title: 'Гамбия', correct: false, question_id: 4},
    {title: 'Мальдивы', correct: false, question_id: 4},
    {title: 'Амазонка', correct: true, question_id: 5},
    {title: 'Нил', correct: false, question_id: 5},
    {title: 'Волга', correct: false, question_id: 5},
    {title: 'Хуанхэ', correct: false, question_id: 5},
]

users = [
    {name: 'Alex', role: 'student'},
    {name: 'Jon', role: 'student'},
    {name: 'Inav', role: 'admin'},
]

completed_tests = [
    {result: true, test_id: 1, user_id: 1},
    {result: false, test_id: 2, user_id: 1},
    {result: true, test_id: 3, user_id: 1},
    {result: true, test_id: 4, user_id: 1},
    {result: true, test_id: 5, user_id: 1},
    {result: true, test_id: 1, user_id: 2},
    {result: false, test_id: 2, user_id: 2},
    {result: false, test_id: 3, user_id: 2},
    {result: true, test_id: 4, user_id: 2},
    {result: false, test_id: 5, user_id: 2},
]

categories.each { |i| Category.create(i) }
tests.each { |i| Test.create(i) }
questions.each { |i| Question.create(i) }
users.each { |i| User.create(i) }
answers.each { |i| Answer.create(i) }
completed_tests.each { |i| CompletedTest.create(i) }