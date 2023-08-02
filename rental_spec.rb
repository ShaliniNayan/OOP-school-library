require_relative 'rental'
require_relative 'book'
require_relative 'person'

describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(name: 'John', age: 25, parent_permission: true) }
  let(:rental) { Rental.new('2023-08-03', book, person) }

  context 'when initializing a rental' do
    it 'should have the correct date, book, and person' do
      expect(rental.date).to eq('2023-08-03')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end

  context 'when converting to a hash' do
    it 'should return a hash with the correct data' do
      expected_hash = {
        'date' => '2023-08-03',
        'book_title' => 'Title',
        'person_id' => person.id
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end
