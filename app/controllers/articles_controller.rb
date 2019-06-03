class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:success] = "記事を投稿しました"
      redirect_to @current_user
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_to @current_user
    end
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:topic, :study_time, :title, :content)
  end
end
