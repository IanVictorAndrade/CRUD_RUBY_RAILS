class Account < ApplicationRecord
  has_many :transfers

  validates :name, presence: true
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
