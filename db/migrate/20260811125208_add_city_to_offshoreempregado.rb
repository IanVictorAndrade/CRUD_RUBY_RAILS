class AddCityToOffshoreempregado < ActiveRecord::Migration[8.1]
  def change
    add_reference :offshoreempregados, :city, null: false, foreign_key: true
  end
end
