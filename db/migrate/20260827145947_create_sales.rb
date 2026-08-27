class CreateSales < ActiveRecord::Migration[8.1]
  def change
    create_table :sales do |t|
      t.string :monthname
      t.integer :amount

      t.timestamps
    end
  end
end
