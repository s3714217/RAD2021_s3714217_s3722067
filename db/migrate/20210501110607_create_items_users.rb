class CreateItemsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :items_users do |t|
      t.integer:item_id, null: false
      t.integer:user_id, null: false 
    end
  end
end
