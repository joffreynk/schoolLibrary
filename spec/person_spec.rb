require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(20, 'Joffrey')
  end

  it 'Test if id exist' do
    expect(@person.id).to be_truthy
  end

  it 'Test if created person has an id which is a number' do
    expect(@person.id).to be_a_kind_of(Numeric)
  end

  it 'Test if @person is an instance of Person' do
    expect(@person).to be_instance_of(Person)
  end
end
