module Api::V1

  class BooksController < ApplicationController

    def index
      @books = Book.all
      render json: @books
    end

    def show
      render(
        status: :ok,
        json: @book.as_json(
          only: [:title, :author, :image_url, :status]
        )
      )
    end

  end
end
