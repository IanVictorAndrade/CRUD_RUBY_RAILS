class CreateTransfers < ActiveRecord::Migration[8.1]
  def change
    create_table :transfers do |t|
      t.decimal :amount
      t.references :from_account, null: false, foreign_key: { to_table: :accounts }
      t.references :to_account, null: false, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
