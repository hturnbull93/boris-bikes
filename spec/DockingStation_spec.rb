require 'boris_bikes'

describe DockingStation do
  subject(:station) { described_class.new }

  it "responds to #release_bike" do
    expect(station).to respond_to(:release_bike)
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
      full_station = DockingStation.new
      full_station.DEFAULT_CAPACITY.times { full_station.dock_bike(Bike.new) }
      expect {full_station.dock_bike(Bike.new)}.to raise_error "Dock full."
    end

    it "docks the passed bike" do
      bike = Bike.new
      expect(station.dock_bike(bike)).to include bike
    end
  end

  it "responds to #storage" do
    expect(station).to respond_to(:storage)
  end

  it "returns the docked bike" do
    bike = Bike.new
    station.dock_bike(bike)
    expect(station.storage).to include bike
  end
end
