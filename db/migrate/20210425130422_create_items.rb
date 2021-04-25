class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :id
      t.text :name
      t.text :category
      t.text :assetname
      t.float :price

      t.timestamps
    end
  end
end
