require 'digest/sha1'

class User < ApplicationRecord
  # validates :name, :email, presence: true

  has_many :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :test_passages
  before_validation :set_role, on: :create

  has_secure_password

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def set_role
    self.role = 'student'
  end
end
