class CreateEmpregadoallowances < ActiveRecord::Migration[8.1]
  def change
    create_table :empregadoallowances do |t|
      t.timestamps
    end
  end
end
