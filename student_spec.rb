require_relative 'student'

describe Student do
  let(:student) { Student.new(name: 'Alice', age: 18, parent_permission: true) }

  context 'when initializing a student' do
    it 'should have the correct name, age, and parent_permission' do
      expect(student.name).to eq('Alice')
      expect(student.age).to eq(18)
      expect(student.parent_permission).to be(true)
    end

    it 'should have a nil classroom initially' do
      expect(student.classroom).to be_nil
    end
  end

  context 'when playing hooky' do
    it "should return a 'play hooky' " do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
