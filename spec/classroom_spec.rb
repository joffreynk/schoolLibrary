require_relative '../classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Classroom')
  end

  it 'creates a new rental' do
    expect(@classroom).to be_an_instance_of(Classroom)
  end

  it 'throws an error if no label is given' do
    expect { Classroom.new }.to raise_error(ArgumentError)
  end

  it 'returns the correct label' do 
    expect(@classroom.label).to eq('Classroom')
  end

  it 'the label is a string' do 
    expect(@classroom.label).to be_a_kind_of(String)
  end

  it 'the label is not empty' do 
    expect(@classroom.label).not_to be_empty
  end
end
