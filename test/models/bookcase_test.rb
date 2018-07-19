require "test_helper"

describe Bookcase do
  let(:bookcase) { Bookcase.new }

  it "must be valid" do
    value(bookcase).must_be :valid?
  end
end
