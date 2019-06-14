class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # ログイン済みのユーザーかどうか確認
  def logged_in_user
    unless logged_in
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  #正しいユーザーかどうか確認
  def correct_user
    @user = User.find_by(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
