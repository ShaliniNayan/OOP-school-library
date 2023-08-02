require './nameable'
require './person'

describe Person do
  let(:person) { Person.new(parent_permission: true, name: 'John', age: 25) }

  context 'when initializing a person' do
    it 'should have the correct name, age, and parent_permission' do
      expect(person.parent_permission).to be(true)
      expect(person.name).to eq('John')
      expect(person.age).to eq(25)
    end
  end
end
