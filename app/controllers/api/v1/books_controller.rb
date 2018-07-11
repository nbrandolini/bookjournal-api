module Api::V1

  class BooksController < ApplicationController
  
    def index
      if params[:query]
        data = BookWrapper.search(params[:query])
      else
        data = Book.all
      end

      render status: :ok, json: data
    end

    def show
      @book = Book.find_by(title: params[:title])
      if @book
        render json: @book.as_json(only:[:title, :author, :published_date, :description, :image_url])
      else
        render json: { ok: false, :errors => "Book/Author not found"}, status: :not_found
      end

    end

  end
end
