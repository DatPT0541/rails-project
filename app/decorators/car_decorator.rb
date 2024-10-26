class CarDecorator < Draper::Decorator
  delegate_all

  def meta_title
    if object.title.present?
      "#{object.title} | Beautiful Cars"
    else
      I18n.t("beautiful_cars")
    end
  end

  def meta_description
    object.description.presence || I18n.t("default_description")
  end

  def image
    h.image_tag(object.image.present? ? object.image.url : "no-image.png")
  end

  def formatted_created_at
    object.created_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{object.brand.presence || 'Unknown'} #{object.model.presence || 'Model'}"
  end
end
