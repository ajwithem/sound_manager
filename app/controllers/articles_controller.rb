class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @articles = Article.find(params[:id])
  end
  def index
    @articles = Article.all ## @articles and NOT @article
  end
  def edit
    @articles = Article.find(params[:id])
  end
  def update
    @articles = Article.find(params[:id])

    if @articles.update(article_params)
      redirect_to @articles
    else
      render 'edit'
    end
  end
  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :artist, :format, :length, :size)
    end
end