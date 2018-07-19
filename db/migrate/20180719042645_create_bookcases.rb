class CreateBookcases < ActiveRecord::Migration[5.2]
  def change
    create_table :bookcases do |t|
      t.string :title
      t.string :author
      t.string :imageLinks

      t.timestamps
    end
  end
end
