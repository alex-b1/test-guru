class Gist < ApplicationRecord
  validates :url, presence: true

  belongs_to :user
  belongs_to :question

end
