require 'boris_bikes'

describe DockingStation do
  subject(:station) { described_class.new }

  it 'responds to #release_bike' do
    expect(station).to respond_to(:release_bike)
  end

  describe '#release_bike' do
    it 'returns error if no bike available' do
      expect{ station.release_bike }.to raise_error 'No bikes available.'
    end

    it 'returns a instance of the Bike class' do
      bike = Bike.new
      station.dock_bike(bike)
      expect(station.release_bike).to be_instance_of(Bike)
    end

    it 'does not release a bike if the bike is broken' do
      broken_bike = Bike.new
      broken_bike.mark_broken
      station.dock_bike(broken_bike)
      expect { station.release_bike }.to raise_error 'No working bikes.'
    end

    it 'releases a bike that is working' do
      working_bike = Bike.new
      station.dock_bike(working_bike)
      expect(station.release_bike).to be_working
    end

    xit 'releases a bike that is working' do
      station.dock_bike(Bike.new)
      broken_bike = Bike.new
      broken_bike.mark_broken
      station.dock_bike(broken_bike)
      expect(station.release_bike).to be_working
    end
  end

  describe '#dock_bike' do
    it 'responds with 1 argument' do
      expect(station).to respond_to(:dock_bike).with(1).argument
    end

    it 'returns error if already has bike docked' do
      full_station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { full_station.dock_bike(Bike.new) }
      expect { full_station.dock_bike(Bike.new) }.to raise_error 'Dock full.'
    end

    it 'docks the passed bike' do
      bike = Bike.new
      expect(station.dock_bike(bike)).to include bike
    end

    it 'when docking, can pass message to say if bike broken' do
      broken_bike = Bike.new
      station.dock_bike(broken_bike, true)
      expect(broken_bike).to_not be_working
    end

    it 'when docking, and no message passed to say if bike broken' do
      working_bike = Bike.new
      station.dock_bike(working_bike)
      expect(working_bike).to be_working
    end
  end

  it 'responds to #storage' do
    expect(station).to respond_to(:storage)
  end

  it 'returns the docked bike' do
    bike = Bike.new
    station.dock_bike(bike)
    expect(station.storage).to include bike
  end

  describe 'variable capacity' do
    it 'can be initialized with a capacity for bikes, at 50' do
      cap_50_station = DockingStation.new(50)
      50.times { cap_50_station.dock_bike(Bike.new) }
      expect { cap_50_station.dock_bike(Bike.new) }.to raise_error 'Dock full.'
    end
    it 'when not set, defaults to 20' do
      cap_20_station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { cap_20_station.dock_bike(Bike.new) }
      expect { cap_20_station.dock_bike(Bike.new) }.to raise_error 'Dock full.'
    end
  end
end
