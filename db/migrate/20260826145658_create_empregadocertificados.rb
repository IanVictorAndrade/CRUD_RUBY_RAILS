class CreateEmpregadocertificados < ActiveRecord::Migration[8.1]
  def change
    create_table :empregadocertificados do |t|
      t.references :empregadoinfo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
