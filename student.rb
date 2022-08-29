require_relative './person.rb'

class Student
  attr_accessor :classroom
  def initialize(name, age, classroom, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
