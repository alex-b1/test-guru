module QuestionsHelper
  def question_header(item)
    item.id ? "Редактировать вопрос #{item.body}" : 'Создать новый вопрос'
  end
end
