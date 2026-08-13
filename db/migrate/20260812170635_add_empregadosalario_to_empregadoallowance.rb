class AddEmpregadosalarioToEmpregadoallowance < ActiveRecord::Migration[8.1]
  def change
    add_reference :empregadoallowances, :empregadosalario, null: false, foreign_key: true
  end
end
