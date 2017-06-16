class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_worker!
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :card_summary, :summary, :category_id, :body, photos: [])
  end
end
