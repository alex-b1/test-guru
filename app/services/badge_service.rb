class BadgeService
  CATEGORY_GEOGRAPHY = '1'

  def rules(user)
    Rule.all.each { |i| send("#{i.title}_rule", user) }
  end

  private

  def all_geography_rule(user)
    success_tests = set_success_tests(user)
    tests_geography = Test.where(category_id: CATEGORY_GEOGRAPHY).pluck(:id)

    pass_cat_geography = (tests_geography - success_tests).empty?

    rule_all_geography = Rule.find_by(title: 'all_geography')
    badge = Badge.find_by(level: '1')
    pass_all_geography = user.rule_passages.find_by(rule_id: rule_all_geography.id)

    if !pass_all_geography && pass_cat_geography
      set_user_badges(user, badge)
      user.rule_passages.create(rule_id: rule_all_geography.id)
    end
  end

  def first_attempt_rule(user)
    badge = Badge.find_by(level: '2')
    test_pass = user.test_passages.where(test_id: user.test_passages.order(:id).last.test_id)

    if test_pass&.count == 1 && test_pass[0].test.questions.count == test_pass[0].correct_questions
      set_user_badges(user, badge)
    end
  end

  def all_level_2_rule(user)
    success_tests = set_success_tests(user)
    tests_level_2 = Test.where(level: '2').pluck(:id)
    pass_level_2 = (tests_level_2 - success_tests).empty?

    rule_all_level_2 = Rule.find_by(title: 'all_level_2')
    badge = Badge.find_by(level: '1')
    pass_all_level_2 = user.rule_passages.find_by(rule_id: rule_all_level_2.id)

    if !pass_all_level_2 && pass_level_2
      set_user_badges(user, badge)
      user.rule_passages.create(rule_id: rule_all_level_2.id)
    end
  end

  def set_user_badges(user, badge)
    user_badges = user.user_badges.find_by(badge_id: badge.id)
    if user_badges
      user_badges.count += 1
      user_badges.save
    else
      user.user_badges.create(badge_id: badge.id, count: 1)
    end
  end

  def set_success_tests(user)
    success_tests = []
    user.test_passages.each {|i| success_tests.push(i.test_id) if i.success? }
    success_tests.uniq
  end
end