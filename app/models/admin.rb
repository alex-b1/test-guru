class Admin < User
  CATEGORY_GEOGRAPHY = '1'
  validates :first_name, presence: true
  validates :last_name, presence: true

  def rules(user, test_id)
    check_all_geography(user, test_id)
    check_first_attempt(user, test_id)
    check_all_level_2(user, test_id)
  end

  private

  def check_all_geography(user, test_id)
    success_tests = set_success_tests(user)
    pass_cat_geography = true
    Test.where(category_id: CATEGORY_GEOGRAPHY).each {|i| pass_cat_geography = false unless success_tests.include?(i.id)}

    rule_all_geography = Rule.find_by(title: 'all_geography')
    badge = Badge.find_by(level: '1')
    pass_all_geography = user.rule_passages.find_by(rule_id: rule_all_geography.id)

    if !pass_all_geography && pass_cat_geography
      set_user_badges(user, badge)
      user.rule_passages.create(rule_id: rule_all_geography.id)
    end
  end

  def check_first_attempt(user, test_id)
    rule_first_attempt = Rule.find_by(title: 'first_attempt')
    badge = Badge.find_by(level: '2')
    test_pass = user.test_passages.where(test_id: test_id)

    if test_pass&.count == 1 && test_pass[0].test.questions.count == test_pass[0].correct_questions
      set_user_badges(user, badge)
    end
  end

  def check_all_level_2(user, test_id)
    success_tests = set_success_tests(user)
    pass_level_2 = true
    Test.where(level: '2').each {|i| pass_level_2 = false unless success_tests.include?(i.id)}

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
    success_tests
  end

end
