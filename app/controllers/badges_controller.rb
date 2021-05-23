class BadgesController < ApplicationController
  def show
    @user_badges = UserBadge.where(user_id: current_user.id)

  end
end
