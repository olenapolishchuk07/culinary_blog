class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :body,  presence: true, length: { minimum: 10 }
  validates :category, inclusion: { in: %w[recipes ingredients places other] }

  CATEGORIES = {
    "recipes"     => "🍳 Рецепти",
    "ingredients" => "🌿 Інгредієнти",
    "places"      => "🍽️ Заклади",
    "other"       => "📝 Інше"
  }.freeze

  def category_label
    CATEGORIES[category] || category
  end

  def excerpt(length = 140)
    body.length > length ? "#{body[0, length].rstrip}…" : body
  end

  def reading_time
    words = body.split.size
    minutes = [(words / 150.0).ceil, 1].max
    "#{minutes} хв читання"
  end
end
