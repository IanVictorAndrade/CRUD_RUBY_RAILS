class AddStateToOffshoreempregado < ActiveRecord::Migration[8.1]
  def change
    add_reference :offshoreempregados, :state, null: false, foreign_key: true
  end
end
