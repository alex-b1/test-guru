class Question < ApplicationRecord
  validates :body, presence: true

  has_many :gists, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :test
  has_many :test_passage, foreign_key: :current_question_id, dependent: :destroy
end
