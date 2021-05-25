class BadgeService
  CATEGORY_GEOGRAPHY = '1'

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      badge.rules.each { |rule| set_user_badges(badge) if  send("#{rule.title}_rule", rule) }
    end
  end

  private

  def all_geography_rule(rule)
    success_tests = TestPassage.success_tests(@user.id).pluck(:test_id).uniq
    tests_geography = Test.where(category_id: CATEGORY_GEOGRAPHY).pluck(:id)
    pass_cat_geography = (tests_geography - success_tests).empty?
    pass_all_geography = @user.rule_passages.find_by(rule_id: rule.id)

    @user.rule_passages.create(rule_id: rule.id) if pass_all_geography.blank? && pass_cat_geography
  end

  def first_attempt_rule(rule)
    test_pass = @user.test_passages.where(test_id: @test_passage.test_id)

    test_pass&.count == 1
  end

  def all_level_2_rule(rule)
    success_tests = TestPassage.success_tests(@user.id).pluck(:test_id).uniq
    tests_level_2 = Test.where(level: '2').pluck(:id)
    pass_level_2 = (tests_level_2 - success_tests).empty?
    pass_all_level_2 = @user.rule_passages.find_by(rule_id: rule.id)

    @user.rule_passages.create(rule_id: rule.id) if !pass_all_level_2 && pass_level_2
  end

  def set_user_badges(badge)
    user_badges = @user.user_badges.find_by(badge_id: badge.id)
    if user_badges
      user_badges.count += 1
      user_badges.save
    else
      @user.user_badges.create(badge_id: badge.id, count: 1)
    end
  end
end