class Employee < ApplicationRecord
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
    end
  end
end
