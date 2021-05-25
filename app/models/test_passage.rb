class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  PASS_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def percent
    correct_questions * 100 / test.questions.count
  end

  def success?
    percent >= PASS_PERCENT
  end

  def position
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  scope :success_tests, -> (user_id) {where(result: true, user_id: user_id)}

  def passed_time(test_passage)
    (test_passage.created_at + test_passage.test.execution_time.to_i * 60) - Time.now
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == (answer_ids || []).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question&.id).first
    end
  end
end
