class Book < ApplicationRecord
  
  def self.sorted_list(status)
    books = Book.all.where(status: status).to_a
  end

end
