class AddDepartmentToEmpregado < ActiveRecord::Migration[8.1]
  def change
    add_reference :empregados, :department, foreign_key: true
  end
end
