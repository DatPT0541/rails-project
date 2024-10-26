class ArticlePolicy
  def initialize user, article
    @user = user
    @article = article
  end

  def update?
    @user.admin? || @user == @article.author
  end
end
