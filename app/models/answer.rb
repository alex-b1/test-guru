class Answer < ApplicationRecord
  validates :title, presence: true
  validate :validate_answers_max_length

  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }

  private

  def validate_answers_max_length
    if question.answers.count >= 4
     errors.add(:question, 'У одного Вопроса может быть от 1-го до 4-х ответов')
    end
  end
end
