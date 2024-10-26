class ArticlesController < ApplicationController
  before_action :authorize_update, only: %i(show)

  def index
    @articles = PopularVideoQuery.new.call
  end

  def show
    @article = ArticlePresenter.new(Article.find(params[:id]))
  end

  private

  def authorize_update
    policy = ArticlePolicy.new(current_user, @article)
    redirect_to root_path, alert: "Access Denied" unless policy.update?
  end
end
