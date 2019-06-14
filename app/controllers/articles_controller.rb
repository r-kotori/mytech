class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  #before_action :correct_user, only: :destroy

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.start_time = DateTime.now
    if @article.save
      flash[:success] = "記事を投稿しました"
      redirect_to @current_user
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_to @current_user
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "記事を編集しました"
      redirect_to @article
    else
      flach[:danger] = "記事の編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "記事が削除されました"
    redirect_to @current_user
  end

  private

  def article_params
    params.require(:article).permit(:topic, :study_time, :title, :content)
  end
end
