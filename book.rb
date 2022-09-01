require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(label, author)
    @id = rand(1000)
    @title = label
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
