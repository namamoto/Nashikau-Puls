class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :product_type_id, null: false
      t.integer :total, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
