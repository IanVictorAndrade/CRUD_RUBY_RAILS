class CreateEmpregadoinfos < ActiveRecord::Migration[8.1]
  def change
    create_table :empregadoinfos do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
