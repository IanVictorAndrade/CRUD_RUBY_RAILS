class CreateOffshoreempregados < ActiveRecord::Migration[8.1]
  def change
    create_table :offshoreempregados do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
