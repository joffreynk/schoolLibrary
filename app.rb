require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'

class App
  attr_accessor :people, :books, :rentals, :classroom

  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = 'Default Class'
  end

  def list_books
    if @books.length.positive?
      books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    else
      puts 'No books added.'
    end
  end

  def list_people
    if @people.length.positive?
      people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'No people added.'
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, @classroom, parent_permission: parent_permission)
    @people.push(student)
    puts 'Student created successfully'
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental(date, person_index, book_index)
    rental = Rental.new(date, @people[person_index], @books[book_index])
    p rental
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_by_id(person_id)
    filtered_rentals = @rentals.select { |rental| rental['person']['id'] == person_id }
    filtered_rentals.each { |rental| puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}" }
  end
end