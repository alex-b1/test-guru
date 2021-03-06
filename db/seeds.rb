# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
badges = Badge.create([
  {title: 'first', level: '1', file_name: 'medal-1.png'},
  {title: 'second', level: '2', file_name: 'medal-2.png'},
  {title: 'third', level: '3', file_name: 'medal-3.png'},
])

rules= Rule.create([
   {title: 'all_geography', description: 'Выдать бэйдж после успешного прохождения всех тестов из категории География', badge_id: badges[0].id},
   {title: 'first_attempt', description: 'Выдать бэйдж после успешного прохождения теста с первой попытки', badge_id: badges[1].id},
   {title: 'all_level_2', description: 'Выдать бэйдж после успешного прохождения всех тестов 2ого уровня', badge_id: badges[0].id},
])

categories = Category.create!([
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
    {title: 'Города', level: 1, category_id: categories[0].id, execution_time: 1},
    {title: 'Животные', level: 2, category_id: categories[1].id, execution_time: 1},
    {title: 'Вещества', level: 1, category_id: categories[2].id, execution_time: 1},
    {title: 'Страны', level: 2, category_id: categories[0].id, execution_time: 1},
    {title: 'Реки', level: 3, category_id: categories[0].id, execution_time: 2},
])

answers = Answer.create!([
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
