class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.belongs_to :item, null: false
      t.belongs_to :user, null: false
      t.string :size
      t.string :colour
      t.integer :quantity
    end
  end
end
