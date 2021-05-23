# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

categories = Category.create([
    {title: 'География'},
    {title: 'Биология'},
    {title: 'Химия'},
])

tests = Test.create!([
    {title: 'Города', level: 1, category_id: categories[0].id},
    {title: 'Животные', level: 2, category_id: categories[1].id},
    {title: 'Вещества', level: 1, category_id: categories[2].id},
    {title: 'Страны', level: 2, category_id: categories[0].id},
    {title: 'Реки', level: 3, category_id: categories[0].id},
])

questions = Question.create([
    {body: 'Столица Италии?', test_id: tests[0].id},
    {body: 'Сколько ног у паука?', test_id: tests[1].id},
    {body: '7 элемент таблицы Менделеева', test_id: tests[2].id},
    {body: 'Самая маленькая страна?', test_id: tests[3].id},
    {body: 'Самая длинная река?', test_id: tests[4].id},
])

answers = Answer.create([
    {title: 'Рим', correct: true, question_id: questions[0].id},
    {title: 'Венеция', correct: false, question_id: questions[0].id},
    {title: 'Неаполь', correct: false, question_id: questions[0].id},
    {title: 'Милан', correct: false, question_id: questions[0].id},
    {title: '8', correct: true, question_id: questions[1].id},
    {title: '7', correct: false, question_id: questions[1].id},
    {title: '6', correct: false, question_id: questions[1].id},
    {title: '5', correct: false, question_id: questions[1].id},
    {title: 'Азот', correct: true, question_id: questions[2].id},
    {title: 'Кислород', correct: false, question_id: questions[2].id},
    {title: 'Фтор', correct: false, question_id: questions[2].id},
    {title: 'Натрий', correct: false, question_id: questions[2].id},
    {title: 'Ватикан', correct: true, question_id: questions[3].id},
    {title: 'Монако', correct: false, question_id: questions[3].id},
    {title: 'Гамбия', correct: false, question_id: questions[3].id},
    {title: 'Мальдивы', correct: false, question_id: questions[3].id},
    {title: 'Амазонка', correct: true, question_id: questions[4].id},
    {title: 'Нил', correct: false, question_id: questions[4].id},
    {title: 'Волга', correct: false, question_id: questions[4].id},
    {title: 'Хуанхэ', correct: false, question_id: questions[4].id},
])
