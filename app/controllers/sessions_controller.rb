class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :logged_in, only: [:new, :create], if: :logged_in?

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'メースアドレスまたはパスワードが違います'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
