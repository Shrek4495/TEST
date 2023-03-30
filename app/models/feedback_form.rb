class FeedbackForm
  include ActiveModel::Model

  attr_accessor :email, :text

  validates :email, :text, presence: true
end