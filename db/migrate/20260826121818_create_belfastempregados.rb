class CreateBelfastempregados < ActiveRecord::Migration[8.1]
  def change
    create_table :belfastempregados do |t|
      t.string :firstname
      t.string :lastname
      t.integer :salary
      t.string :notes

      t.timestamps
    end
  end
end
