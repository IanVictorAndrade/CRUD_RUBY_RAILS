class Empregadoinfo < ApplicationRecord

  has_many :empregadocertificados, dependent: :destroy
  accepts_nested_attributes_for :empregadocertificados
  has_one_attached :pan_card
end
