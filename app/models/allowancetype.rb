class Allowancetype < ApplicationRecord
  has_many :empregadoallowances
  has_many :empregadosalarios, through: :empregadoallowances
end
