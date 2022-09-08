require_relative '../classroom'

describe Classroom do
  before(:each) do
    @book = Classroom.new('Classroom')
  end

  it 'creates a new rental' do
    expect(@book).to be_an_instance_of(Classroom)
  end

  it 'throws an error if no label is given' do
    expect { Classroom.new }.to raise_error(ArgumentError)
  end

  it 'returns the correct label' do 
    expect(@book.label).to eq('Classroom')
  end

  it 'the label is a string' do 
    expect(@book.label).to be_a_kind_of(String)
  end

  it 'the label is not empty' do 
    expect(@book.label).not_to be_empty
  end
end
