require 'bike'

describe Bike do
  subject(:bike) { described_class.new }

  it 'responds to #working?' do
    expect(bike).to respond_to(:working?)
  end

  it 'should work' do
    expect(bike).to be_working
  end
end
