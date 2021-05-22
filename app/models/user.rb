class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :gists
  has_many :test_passages
  has_many :rule_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :test_passages
  has_many :rules, through: :rule_passages
  has_many :user_badges

  def admin?
    is_a?(Admin)
  end

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
end
