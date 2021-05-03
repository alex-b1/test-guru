class Category < ApplicationRecord
  validates :title, presence: true

  has_many :tests

  scope_default { order(title: asc) }
end
