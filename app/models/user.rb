class User < ApplicationRecord
  def test_by_level(level)
    Test.joins('JOIN completed_tests ON tests.id = completed_tests.test_id')
        .where('completed_tests.user_id = :id AND tests.level = :level', id, level)
  end
end
