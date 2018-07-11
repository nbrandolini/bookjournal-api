class BookWrapper
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"
  KEY = ENV["API_KEY"]

  def self.search(query)
    url = BASE_URL + "?q=" + "&API_KEY=" + KEY
    response = HTTParty.get(url)
    if response["total_results"] == 0
      return []
    else
      books = response["results"].map do |result|
        self.construct_book(result)
      end
      return books
    end
  end

  private

  def self.construct_book(api_result)
    Book.new(
      title: api_result["title"],
      authors: api_result["authors"],
      published_date: api_result["publishedDate"],
      image_url: api_result["imageLinks"],
      description: api_result["description"],
      external_id: api_result["id"]
    )
  end
end
