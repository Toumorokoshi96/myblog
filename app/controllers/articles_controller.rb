class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @articles = Article.all.order("id DESC").page(params[:page]).per(4)
  end
  
  def new
    @article = Article.new
  end

  def create
    Article.create(article_params_permitted)
    #create.html.erbへリダイレクト
  end

  def edit
    @article_id = params[:id]
    @article = Article.find(@article_id)
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params_permitted) if article.user_id == current_user.id
  end

  def destroy
    article = Article.find(params[:id])
     article.destroy if article.user_id == current_user.id
  end

  private
  def article_params_permitted
    params.require(:article).permit(:name, :title, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
