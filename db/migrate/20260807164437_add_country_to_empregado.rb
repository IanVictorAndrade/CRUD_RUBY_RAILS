class AddCountryToEmpregado < ActiveRecord::Migration[8.1]
  def change
    add_reference :empregados, :country, foreign_key: true
  end
end
