require 'json'
require_relative 'book'

describe Book do
  let(:book) { Book.new('Title', 'Author') }

  context 'when initializing a book' do
    it 'should have the correct title and author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it 'should have an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  context 'when calling methods' do
    it 'should return correct name' do
      expect(book.correct_name).to eq('Title')
    end

    it 'should always use services' do
      expect(book.can_use_services?).to be true
    end

    it 'should add a rental to the book' do
      rental = double('Rental')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end

  context 'when adding rentals' do
    it 'should add a rental to the book' do
      rental = double('Rental')
      expect { book.add_rental(rental) }.to change { book.rentals.size }.by(1)
    end
  end
end
