require 'boris_bikes'

describe DockingStation do
  subject(:station) { described_class.new }

  it "responds to #release_bike" do
    expect(station).to respond_to(:release_bike)
  end

  it "has a default capacity of 20 bikes" do
    expect(station.capacity).to eq 20
  end

  describe "#release_bike" do
    it "returns error if no bike available" do
      expect{station.release_bike}.to raise_error "No bikes available."
    end

    it "returns a instance of the Bike class" do
      bike = Bike.new
      station.dock_bike(bike)
      expect(station.release_bike).to be_instance_of(Bike)
    end
  end
  
  describe "#dock_bike" do
    it "responds with 1 argument" do
      expect(station).to respond_to(:dock_bike).with(1).argument
    end
    
    it "returns error if already has bike docked" do
      bike = Bike.new
      another_station = DockingStation.new
      another_station.dock_bike(bike)
      another_bike = Bike.new
      expect {another_station.dock_bike(another_bike)}.to raise_error "Dock full."
    end

    it "docks the passed bike" do
      bike = Bike.new
      expect(station.dock_bike(bike)).to eq bike
    end
  end

  it "responds to #bike" do
    expect(station).to respond_to(:bike)
  end

  it "returns the docked bike" do
    bike = Bike.new
    station.dock_bike(bike)
    expect(station.bike).to eq bike
  end
end
