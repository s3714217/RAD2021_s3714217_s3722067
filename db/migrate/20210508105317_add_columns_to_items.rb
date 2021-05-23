class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :tag, :string
    add_column :items, :colour, :string
    add_column :items, :size, :string
    add_column :items, :popularity, :integer
  end
end
