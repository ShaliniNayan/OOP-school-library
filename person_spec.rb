require './nameable'
require './person'
require './book'
require './rental'

describe Person do
  let(:person) { Person.new(parent_permission: true, name: 'John', age: 25) }

  context 'when initializing a person' do
    it 'should have the correct name, age, and parent_permission' do
      expect(person.parent_permission).to be(true)
      expect(person.name).to eq('John')
      expect(person.age).to eq(25)
    end
  end

  context 'when calling methods' do
    it 'should add a rental to the person' do
      book = Book.new('Book Title', 'Book Author')
      rental = person.add_rental('2023-08-02', book)
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end

    it 'should return the correct name' do
      expect(person.correct_name).to eq('John')
    end

    it 'should check if the person can use services' do
      expect(person.can_use_services?).to be(true)
    end

    it 'should allow a person of age to use services' do
      person.age = 20
      expect(person.can_use_services?).to be(true)
    end

    it 'should allow a person with parent permission to use services' do
      person.age = 15
      person.parent_permission = true
      expect(person.can_use_services?).to be(true)
    end

    it 'should not allow a person without parent permission and below 18 to use services' do
      person.age = 17
      person.parent_permission = false
      expect(person.can_use_services?).to be(false)
    end
  end
end
