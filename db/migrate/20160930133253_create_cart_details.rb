class CreateCartDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_details do |t|
      t.integer :number
      t.float :price
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
