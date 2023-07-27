require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = nil
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
