require './person'
require './book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rental << self
    @person = person
    person.rentals << self
  end
end
