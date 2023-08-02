require_relative 'teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', name: 'Bob', age: 35, parent_permission: true) }

  context 'when initializing a teacher' do
    it 'should have the correct name, age, and parent_permission' do
      expect(teacher.name).to eq('Bob')
      expect(teacher.age).to eq(35)
      expect(teacher.parent_permission).to be(true)
    end
  end

  context 'when using services' do
    it 'should always return true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
