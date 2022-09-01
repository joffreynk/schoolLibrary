require './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(label, author)
    @title = label
    @author = author
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end
