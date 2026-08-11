class Country < ApplicationRecord
  has_many :empregados

  has_many :states
  has_many :cities, through: :states

end
