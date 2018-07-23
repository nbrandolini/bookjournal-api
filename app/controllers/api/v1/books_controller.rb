module Api::V1

  class BooksController < ApplicationController

    def index
      @books= Book.all
      render json: @books
      @read = Book.all.where(status:"read")
    end

    def show
      render(
        status: :ok,
        json: @book.as_json(
          only: [:title, :author, :image_url, :status]
        )
      )
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        render(
          status: :ok,
          json: @book.as_json(
            only: [:title, :author, :image_url, :status]
          )
        )
      end
    end

    private

    def book_params
      return params.require(:book).permit(:status, :title, :author)
    end
  end

end
