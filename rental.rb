class Rental
  attr_reader :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  def self.save_rentals_to_json(rentals)
    rentals_data = rentals.map(&:to_hash)
    File.write('rentals.json', JSON.pretty_generate(rentals_data))
  end

  def self.load_rentals_from_json(books, people)
    rentals_data = JSON.parse(File.read('rentals.json'))
    rentals_data.map do |data|
      book = Book.find_by_title(books, data['book_title'])
      person = Person.find_by_id(people, data['person_id'])
      Rental.new(data['date'], book, person)
    end
  end

  def to_hash
    {
      'date' => @date,
      'book_title' => @book.title,
      'person_id' => @person.id
    }
  end
end
