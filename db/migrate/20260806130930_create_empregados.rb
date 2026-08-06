class CreateEmpregados < ActiveRecord::Migration[8.1]
  def change
    create_table :empregados do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
