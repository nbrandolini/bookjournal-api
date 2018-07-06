module Api::V1
  
  class BooksController < ApplicationController
    def index
      @books = Book.all
      render json: @books
    end

    def show
      @book = Book.find_by(id: params[:id])
      if @book
        render json: @book.as_json(only:[:title, :author])
      else
        render json: { ok: false, :errors => "Book/Author not found"}, status: :not_found
      end

    end

  end
end
