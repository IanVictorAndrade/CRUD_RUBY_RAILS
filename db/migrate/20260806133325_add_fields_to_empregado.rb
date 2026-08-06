class AddFieldsToEmpregado < ActiveRecord::Migration[8.1]
  def change
    add_column :empregados, :haspassport, :boolean
    add_column :empregados, :salary, :integer
    add_column :empregados, :notes, :string
    add_column :empregados, :birthdate, :date
    add_column :empregados, :hiredate, :date
    add_column :empregados, :gender, :string
  end
end
