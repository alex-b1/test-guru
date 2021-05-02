class User < ApplicationRecord
  has_many :completed_tests
  has_many :tests
  has_many :tests, through: :completed_tests

  def test_by_level(level)
    tests.where(level: level)
  end
end
