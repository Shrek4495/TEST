class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence: true
  def show_all_tests(level)

    tests.where(level: level)
  end
end
