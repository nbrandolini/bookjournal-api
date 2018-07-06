require "test_helper"

describe Api::V1::BooksController do
  it "should get index" do
    get api_v1_books_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get api_v1_books_show_url
    value(response).must_be :success?
  end

end
