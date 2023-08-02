require 'json'
require './book'

describe Book do
  let(:book) { Book.new('Title', 'Author') }

  context "when initializing a book" do
    it "should have the correct title and author" do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it "should have an empty rentals array" do
      expect(book.rentals).to be_empty
    end
  end
end
