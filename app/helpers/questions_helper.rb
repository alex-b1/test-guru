module QuestionsHelper
  def question_header(item)
    item.persisted? ? "Редактировать вопрос #{item.body}" : 'Создать новый вопрос'
  end
end
