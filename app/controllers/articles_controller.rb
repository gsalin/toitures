class ArticlesController < ApplicationController
  skip_before_action :authenticate_worker!
  skip_before_action :authenticate_user!, except: [:new, :create, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  def new
    @user = current_user
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:id])
    @article.user = current_user

    if @article.save
       @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :card_summary, :summary, :category_id, :body, :photo_presentation, :second_photo )
  end
end
