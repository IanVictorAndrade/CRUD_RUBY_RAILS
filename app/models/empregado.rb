class Empregado < ApplicationRecord
  belongs_to :country
  belongs_to :department

  has_rich_text :notes

  scope :search, -> (query) {
    if query.present?
      left_joins(:department).where(
        "empregados.id LIKE ? OR firstname LIKE ? OR lastname LIKE ? OR departments.name LIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    else
      all
    end
  }
end
