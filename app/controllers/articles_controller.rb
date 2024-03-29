class ArticlesController < ApplicationController
  def new 
    @article = Article.new
  end
  
  def show
    @article= Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    params.permit!
    @article= Article.new(params[:article])
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article= Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render'edit'
    end
  end
  
  private
    def article_params
      params .require(:article) .permit(:title, :text)
    end
end
