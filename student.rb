require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end
  puts self

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
