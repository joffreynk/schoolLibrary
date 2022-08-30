require_relative './nameable'

class Decorator
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable
  end
end
