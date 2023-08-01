require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(parent_permission: true, name: 'Unknown', age: nil)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.add_rental(rental)
    rental
  end

  def self.save_people_to_json(people)
    people_data = people.map(&:to_hash)
    File.write('people.json', JSON.pretty_generate(people_data))
  end

  def self.load_people_from_json(_books)
    people_data = JSON.parse(File.read('people.json'))
    people_data.map do |data|
      if data['type'] == 'Student'
        Student.new(name: data['name'], age: data['age'], parent_permission: data['parent_permission']).tap do |student|
          data['rentals'].each do |rental_data|
            Rental.new(rental_data['date'], nil, student)
          end
        end
      elsif data['type'] == 'Teacher'
        Teacher.new(data['specialization'], name: data['name'], age: data['age'], parent_permission: data['parent_permission']).tap do |teacher|
          data['rentals'].each do |rental_data|
            Rental.new(rental_data['date'], nil, teacher)
          end
        end
      end
    end
  end

  def to_hash
    {
      'type' => self.class.name,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization,
      'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
    }
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
