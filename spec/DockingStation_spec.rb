require 'boris_bikes'

describe DockingStation do
  subject(:station) { described_class.new }

  it "responds to #release_bike" do
    expect(station).to respond_to(:release_bike)
  end

  describe "#release_bike" do
    it "returns a instance of the Bike class" do
      expect(station.release_bike).to be_instance_of(Bike)
    end
  end

  it "responds to #dock_bike with 1 argument" do
    expect(station).to respond_to(:dock_bike).with(1).argument
  end
  
  it "responds to #bike" do
    expect(station).to respond_to(:bike)
  end

  it "#docks_bike docks the passed bike" do
    bike = Bike.new
    expect(station.dock_bike(bike)).to eq bike
  end

  it "returns the docked bike" do
    bike = Bike.new
    station.dock_bike(bike)
    expect(station.bike).to eq bike
  end
end
