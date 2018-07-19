class RemoveCategories < ActiveRecord::Migration[5.2]
  def change
    remove_index :books, :category_id
    remove_column :books, :category_id, :bigint
    drop_table :categories
  end
end
