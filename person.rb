class Person
  attr_accessor :name, :age
  attr_reader :id
  def initialize(age, name = 'unknown', parent_permission = true)
    @id  =  DateTime.new.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    self.is_of_age || @parent_permission
  end

  private
  def is_of_age
    @age >= 18
  end
end