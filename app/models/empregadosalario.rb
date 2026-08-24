class Empregadosalario < ApplicationRecord
  has_many :empregadoallowances, dependent: :destroy
  has_many :allowancetypes, through: :empregadoallowances
end
