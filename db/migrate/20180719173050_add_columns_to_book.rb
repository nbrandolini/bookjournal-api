class AddColumnsToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :image_url, :string
    add_column :books, :status, :string
  end
end
