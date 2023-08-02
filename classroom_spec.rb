require_relative 'classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Math Class') }
  let(:student1) { double('Student') }
  let(:student2) { double('Student') }

  context "when initializing a classroom" do
    it "should have the correct label" do
      expect(classroom.label).to eq('Math Class')
    end

    it "should have an empty list of students" do
      expect(classroom.students).to be_empty
    end
  end

  context "when adding a student" do
    before do
      allow(student1).to receive(:classroom=)
      allow(student2).to receive(:classroom=)
    end

    it "should set the classroom for the student" do
      classroom.add_student(student1)
      expect(student1).to have_received(:classroom=).with(classroom)
    end

    it "should add the student to the list of students" do
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end

    it "should add multiple students to the list of students" do
      classroom.add_student(student1)
      classroom.add_student(student2)
      expect(classroom.students).to include(student1, student2)
    end
  end
end
