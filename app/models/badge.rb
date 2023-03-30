class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :file, :reason, :rule_value, presence: true
  validates :rule_type, presence: true, uniqueness: { scope: :rule_value }
  validates :rule_type, inclusion: { in: BadgeIssuance::RULES,
                                     message: I18n.t('activerecord.errors.messages.rule_type') }

end
