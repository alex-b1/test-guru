class Badge < ApplicationRecord
  has_many :user_badges
  has_many :rules
end
