class Feedback < ApplicationRecord
  validates :email, presence: true
  validates :comment, presence: true
end
