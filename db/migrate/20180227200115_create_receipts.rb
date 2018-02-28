class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :name
      t.string :currency
      t.decimal :amount
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
