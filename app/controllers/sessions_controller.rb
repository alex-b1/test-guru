class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      if cookies[:path]
        redirect_to cookies.delete :path
      else
        redirect_to tests_path
      end
    else
      flash[:alert] = 'Проверьте ваш Email и пароль'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
