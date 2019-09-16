class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @articles = Article.all.order("id DESC").page(params[:page]).per(4)
  end
  
  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    #
  end

  def edit
    #@article = Article.findその記事のid
  end

  def update
    #
  end

  def destroy
    @current_user_id = current_user.id
    #Article.delete(v)
  end

  private
  def article_params
    params.require(:article).permit(:name, :title, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
