class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  before_action :correct_user, only:[:edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: params[:id])
    user_study_time
    user_study_topic
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "アカウントを作成しました"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      flach[:danger] = "プロフィールの編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:user_id]).destroy
    flash[:success] = "アカウントが削除されました"
    redirect_to request.referrer || root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
                                   :password, :password_confirmation, :image)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def user_study_time
      sum = Article.where(user_id: params[:id]).group(:topic).sum(:study_time)
      sum = sum.sort_by { |_, v | -v }.to_h
      gon.data1 = sum.values
    end

    def user_study_topic
      sum = Article.where(user_id: params[:id]).group(:topic).sum(:study_time)
      sum = sum.sort_by { |_, v | -v }.to_h
      gon.data2 = sum.keys
    end
end
