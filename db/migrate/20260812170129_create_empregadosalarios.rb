class CreateEmpregadosalarios < ActiveRecord::Migration[8.1]
  def change
    create_table :empregadosalarios do |t|
      t.integer :salary
      t.integer :netallowanceamount
      t.integer :netsalary

      t.timestamps
    end
  end
end
