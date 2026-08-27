class Empregadocertificado < ApplicationRecord
  belongs_to :empregadoinfo
  has_one_attached :certi
end
