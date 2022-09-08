require_relative '../student'

describe Student do
  it 'creates a new student' do
    expect(Student.new(20, 'Joffrey', 'classroom')).to be_an_instance_of(Student)
  end

  it 'creates a new student with a classroom' do
    student = Student.new(20, 'Joffrey', 'classroom')
    expect(student.classroom).to eq('classroom')
  end

  it 'creates a student with a classroom and a parent permission' do
    student = Student.new(25, 'david', 'classroom')
    expect(student.parent_permission).to be(true)
  end
  it 'should print custom message when student plays hooky' do
    student = Student.new(20, 'Joffrey', 'classroom')
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
