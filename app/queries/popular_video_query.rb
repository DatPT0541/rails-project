class PopularVideoQuery
  def call relation = Article.all
    relation.where(type: "video").where("view_count > ?", 100)
  end
end
