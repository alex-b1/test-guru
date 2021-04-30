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

categories.each { |i| Category.create(i) }

tests = [
    {title: 'Города', level: 1, category_id: Category.find_by(title: 'География').id},
    {title: 'Животные', level: 2, category_id: Category.find_by(title: 'Биология').id},
    {title: 'Вещества', level: 1, category_id: Category.find_by(title: 'Химия').id},
    {title: 'Страны', level: 2, category_id: Category.find_by(title: 'География').id},
    {title: 'Реки', level: 3, category_id: Category.find_by(title: 'География').id},
]

tests.each { |i| Test.create(i) }

questions = [
    {body: 'Столица Италии?', test_id: Test.find_by(title: 'Города').id},
    {body: 'Сколько ног у паука?', test_id: Test.find_by(title: 'Животные').id},
    {body: '7 элемент таблицы Менделеева', test_id: Test.find_by(title: 'Вещества').id},
    {body: 'Самая маленькая страна?', test_id: Test.find_by(title: 'Страны').id},
    {body: 'Самая длинная река?', test_id: Test.find_by(title: 'Реки').id},
]

questions.each { |i| Question.create(i) }

answers = [
    {title: 'Рим', correct: true, question_id: Question.find_by(body: 'Столица Италии?').id},
    {title: 'Венеция', correct: false, question_id: Question.find_by(body: 'Столица Италии?').id},
    {title: 'Неаполь', correct: false, question_id: Question.find_by(body: 'Столица Италии?').id},
    {title: 'Милан', correct: false, question_id: Question.find_by(body: 'Столица Италии?').id},
    {title: '8', correct: true, question_id: Question.find_by(body: 'Сколько ног у паука?').id},
    {title: '7', correct: false, question_id: Question.find_by(body: 'Сколько ног у паука?').id},
    {title: '6', correct: false, question_id: Question.find_by(body: 'Сколько ног у паука?').id},
    {title: '5', correct: false, question_id: Question.find_by(body: 'Сколько ног у паука?').id},
    {title: 'Азот', correct: true, question_id: Question.find_by(body: '7 элемент таблицы Менделеева').id},
    {title: 'Кислород', correct: false, question_id: Question.find_by(body: '7 элемент таблицы Менделеева').id},
    {title: 'Фтор', correct: false, question_id: Question.find_by(body: '7 элемент таблицы Менделеева').id},
    {title: 'Натрий', correct: false, question_id: Question.find_by(body: '7 элемент таблицы Менделеева').id},
    {title: 'Ватикан', correct: true, question_id: Question.find_by(body: 'Самая маленькая страна?').id},
    {title: 'Монако', correct: false, question_id: Question.find_by(body: 'Самая маленькая страна?').id},
    {title: 'Гамбия', correct: false, question_id: Question.find_by(body: 'Самая маленькая страна?').id},
    {title: 'Мальдивы', correct: false, question_id: Question.find_by(body: 'Самая маленькая страна?').id},
    {title: 'Амазонка', correct: true, question_id: Question.find_by(body: 'Самая длинная река?').id},
    {title: 'Нил', correct: false, question_id: Question.find_by(body: 'Самая длинная река?').id},
    {title: 'Волга', correct: false, question_id: Question.find_by(body: 'Самая длинная река?').id},
    {title: 'Хуанхэ', correct: false, question_id: Question.find_by(body: 'Самая длинная река?').id},
]

answers.each { |i| Answer.create(i) }

users = [
    {name: 'Alex', role: 'student'},
    {name: 'Jon', role: 'student'},
    {name: 'Inav', role: 'admin'},
]

users.each { |i| User.create(i) }

students = User.where(role: 'student')
completed_tests = []

students.each do |i|
  tests = Test.all
  tests.each do |j|
    completed_tests.push({result: [true, false].sample, test_id: j.id, user_id: i.id})
  end
end

completed_tests.each { |i| CompletedTest.create(i) }