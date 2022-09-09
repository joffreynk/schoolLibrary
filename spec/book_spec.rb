require_relative '../book'
require 'json'

describe Book do
  before(:each) do
    @book = Book.new('Best Practices react', 'Microverse')
  end

  describe '#new' do
    it 'creates a new book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'throws an error if no title is given' do
      expect { Book.new }.to raise_error(ArgumentError)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eq('Best Practices react')
    end
  end
end
