class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_redirected!

  private

  def admin_redirected!
    redirect_to root_path, alert: 'Вы не авторизованы для просмтора данной страницы.' unless current_user.admin?
  end
end