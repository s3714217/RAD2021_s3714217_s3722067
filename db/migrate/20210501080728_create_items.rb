class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :itemdescription
      t.string :asseturl

      t.timestamps
    end
  end
end
