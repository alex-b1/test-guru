class Rule < ApplicationRecord
  has_many :rule_passages, dependent: :destroy
  has_many :users, through: :rule_passages
end
