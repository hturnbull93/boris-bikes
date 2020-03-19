require 'boris_bikes'

describe Bike do
  subject(:bike) { described_class.new }
  
  it "responds to #working?" do
    expect(bike).to respond_to(:working?)
  end


  describe "bike" do
    it "to be working (#working?)" do
      expect(bike).to be_working
    end
  end

end