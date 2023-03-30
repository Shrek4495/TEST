class BadgeIssuance
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  RULES = %w[category level first_try].freeze

  def give_badges
    Badge.select { |badge| send badge.rule_type, badge }
  end

  def first_try(badge)
    last_badge_date = UserBadge.where(badge: badge).order(created_at: :desc).first.created_at
    if last_badge_date.present?
      @user.tests.where(title: @test_passage.test.title).where('test_passages.created_at > ?', last_badge_date)
           .count.eql?(badge.rule_value.to_i) && @test_passage.successful
    else
      @user.tests.where(title: @test_passage.test.title).count.eql?(badge.rule_value.to_i) && @test_passage.successful
    end
  end

  def category(badge)
    return false unless @test_passage.test.category.title.eql?(badge.rule_value)

    last_badge_date = UserBadge.where(badge: badge).order(created_at: :desc).first&.created_at

    category_tests_ids = Test.joins(:category).where(categories: { title: badge.rule_value }).select(:id)
    user_tests = @user.tests.joins(:category).where(categories: { title: badge.rule_value })
                      .where('test_passages.successful')

    user_tests_ids = if last_badge_date.present?
                       user_tests.where('test_passages.created_at > ?', last_badge_date).select(:id)
                     else
                       user_tests.select(:id)
                     end

    (category_tests_ids - user_tests_ids).empty?
  end
  def level(badge)
    return false unless @test_passage.test.level.eql?(badge.rule_value.to_i)

    last_badge_date = UserBadge.where(badge: badge).order(created_at: :desc).first&.created_at

    level_tests_ids = Test.where(level: badge.rule_value.to_i).select(:id)
    user_tests = @user.tests.where(level: badge.rule_value.to_i).where('test_passages.successful')

    user_tests_ids = if last_badge_date.present?
                       user_tests.where('test_passages.created_at > ?', last_badge_date).select(:id)
                     else
                       user_tests.select(:id)
                     end

    (level_tests_ids - user_tests_ids).empty?
  end
end