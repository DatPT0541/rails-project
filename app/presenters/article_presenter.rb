class ArticlePresenter < SimpleDelegator
  def formatted_title
    "#{title} | Awesome Blog"
  end

  def formatted_date
    created_at.strftime("%B %e, %Y")
  end
end
