class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
