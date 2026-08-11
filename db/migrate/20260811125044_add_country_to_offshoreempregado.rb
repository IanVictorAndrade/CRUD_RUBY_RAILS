class AddCountryToOffshoreempregado < ActiveRecord::Migration[8.1]
  def change
    add_reference :offshoreempregados, :country, null: false, foreign_key: true
  end
end
