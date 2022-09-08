require_relative '../teacher'

describe Teacher do

  before(:each) do
    @teacher  = Teacher.new(14, 'Math', 'Desor')
  end
  it 'should teacher specialized in Math' do
    expect(@teacher.specialization).to eq 'Math'
  end

  it 'should teacher use services' do
    expect(@teacher.can_use_services()).to be true
  end

  it 'teacher has always parent permission' do
    expect(@teacher.parent_permission).to be true
  end
end
