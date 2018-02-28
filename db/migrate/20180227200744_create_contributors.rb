class CreateContributors < ActiveRecord::Migration[5.1]
  def change
    create_table :contributors do |t|
      t.references :user, foreign_key: true
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
