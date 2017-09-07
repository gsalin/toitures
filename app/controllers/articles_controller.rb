class ArticlesController < ApplicationController
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
    this_id = current_user.id
    if @article.user_id != this_id
      redirect_to root_path
    end
  end

  def update
    @article = Article.friendly.find(params[:id])

    if @article.save
       @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def energie
    @articles = Article.energie
  end

  def environnement
    @articles = Article.environnement
  end

  def technique
    @articles = Article.technique
  end

  def style
    @articles = Article.style
  end

  def patrimoine
    @articles = Article.patrimoine
  end

  def mes_articles
    this_id = current_user.id
    @articles = Article.where(user_id: this_id)
  end

  private

  def article_params
    params.require(:article).permit(:title, :card_summary, :summary, :body, :photo_presentation, :second_photo, :category, :caption)
  end
end
