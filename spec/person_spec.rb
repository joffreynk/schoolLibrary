require_relative '../rental'

describe Person do
  before(:each) do
    @person = Person.new(20, 'Joffrey')
    @book = Book.new('Best Practices react', 'Microverse')
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

  it 'should person use services' do
    expect(@person.can_use_services).to be true
  end

  it 'person can add rentals' do
    @person.add_rental(@book, '20/5/2023')
    expect(@person.rentals.length).to eq 1
  end
end
