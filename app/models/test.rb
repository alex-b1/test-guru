class Test < ApplicationRecord
  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.list_names(category)
    joins(:category)
        .where(categories: {title: category})
        .order('tests.title DESC')
        .pluck(:title)
  end
end
