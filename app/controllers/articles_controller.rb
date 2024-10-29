class ArticlesController < ApplicationController
  include Authenticable
  before_action :authenticate_admin!, only: %i(index)
  before_action :set_article, only: %i(show)

  def index
    @articles = Article.all
    render json: @articles.map{|article| article_data(article)}
  end

  def show
    render json: article_data(@article)
  end

  private

  def set_article
    @article = Article.find_by(hash_id: params[:hash_id])
    return if @article

    render json: {error: "Article not found"}, status: :not_found
  end

  def article_data article
    {
      hash_id: article.hashed_id,
      title: article.title,
      content: article.content
    }
  end
end
