class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user, only:[:edit, :update]

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: current_user)
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
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
                                   :password, :password_confirmation)
    end

    def user_study_time
      gon.data1 = Article.pluck(:study_time).map(&:to_i)
    end

    def user_study_topic
      gon.data2 = Article.pluck(:topic)
    end

end
