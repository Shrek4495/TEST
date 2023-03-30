module BadgesHelper
  def badge_header(badge)
    return 'Новый бейдж' if badge.new_record?

    "Редактирование бейджа: #{badge.name}"
  end

  def rules_type_values
    BadgeIssuance::RULES.map { |rule| I18n.t(:rules)[rule.to_sym] }
  end
end
