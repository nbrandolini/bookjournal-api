require 'csv'

category_data = JSON.parse(File.read('db/seeds/categories.json'))

category_data.each do |category|
  Category.create!(category)
end

book_data = JSON.parse(File.read('db/seeds/books.json'))

book_data.each do |book|
  Book.create!(book)
end

BOOK_CAT_FILE = Rails.root.join('db', 'seeds','organization_categories.csv')
puts "Loading raw organization_categories data from #{ORG_CAT_FILE}"

CSV.foreach(ORG_CAT_FILE, :headers => true) do |row|
  book = Book.find(row['book_id'])
  category = Category.find(row['category_id'])
  category.books << book
end
