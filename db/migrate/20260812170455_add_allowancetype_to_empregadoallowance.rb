class AddAllowancetypeToEmpregadoallowance < ActiveRecord::Migration[8.1]
  def change
    add_reference :empregadoallowances, :allowancetype, null: false, foreign_key: true
  end
end
