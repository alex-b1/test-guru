class Test < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than: 0}

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

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :title_categories, ->(category) { joins(:category).where(categories: {title: category}) }

  def self.title_categories_list(category)
    title_categories(category).order(title: :desc).pluck(:title)
  end
end
