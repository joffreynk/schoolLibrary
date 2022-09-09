require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Rental do
  before(:each) do
    @person = Person.new(20, 'Joffrey')
    @book = Book.new('Best Practices react', 'Microverse')
    @rental = Rental.new('25/1/2022', @person, @book)
  end

  it 'Joffrey rent  book' do
    expect(@rental.person.name).to eq 'Joffrey'
  end

  it 'should rental.book to be an instance of book' do
    expect(@rental.book).to be_instance_of(Book)
  end

  it 'test if Joffrey has parent permission' do
    expect(@rental.person.parent_permission).to eq true
  end
end
