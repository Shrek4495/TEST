class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :tests_users, dependent: :destroy

  def self.sort_descending(category_title)

    joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
