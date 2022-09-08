require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require 'json'
require 'fileutils'

class App
  attr_accessor :people, :books, :rentals, :classroom

  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = 'Default Class'
    load_people
    load_books
    loadrentals
  end

  def load_people
    people_file = File.read('./person.json')
    new_people = JSON.parse(people_file)
    new_people.each do |person|
      if person['class'] == 'Student'
        student = Student.new(person['age'], person['name'], @classroom,
                              parent_permission: person['parent_permission'])
        @people.push(student)
      end
      if person['class'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        @people.push(teacher)
      end
    end
  end

  def write_people
    writepeoples = []
    people.each do |person|
      if person.class.to_s == 'Teacher'
        writepeoples.push({ class: 'Teacher', age: person.age, specialization: person.specialization,
                            name: person.name })
      end

      if person.class.to_s == 'Student'
        writepeoples.push({ class: 'Student', age: person.age, parent_permission: true, name: person.name })
      end
    end
    File.write('./person.json', JSON.dump(writepeoples))
  end

  # Write and read books
  def load_books
    book_file = File.read('./book.json')
    new_book = JSON.parse(book_file)
    new_book.each do |book|
      book_i = Book.new(book['title'], book['author'])
      @books.push(book_i)
    end
  end

  def write_books
    writebooks = []
    books.each do |book|
      writebooks.push({ title: book.title, author: book.author })
    end
    File.write('./book.json', JSON.dump(writebooks))
  end

  # load rentals from files
  def loadrentals()
    rentals_file = File.read('./rentals.json')
    new_rentals = JSON.parse(rentals_file)
    puts 'rentals loading'
    new_rentals.each do |rental|
      book = @books.select { |newb| newb.title == rental['title'] }.first
      person = @people.select { |newp| newp.name == rental['person'] }.first
      rental = Rental.new(rental['date'], person, book)
      @rentals.push(rental)
    end
  end

  def write_rentals
    writerentals = []
    rentals.each do |rental|
      writerentals.push({ date: rental.date, title: rental.book.title, person: rental.person.name })
    end
    File.write('./rentals.json', JSON.dump(writerentals))
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
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    if @rentals.length.positive?
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title},\
  Author: #{rental.book.author}, borrowed by: #{rental.person.name}"
      end
    else
      puts 'No rental added.'
    end
  end
end
