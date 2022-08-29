require_relative './person.rb'

class Teacher
  attr_accessor :specialization
  def initialize(name, age, specialization, parent_permission)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end